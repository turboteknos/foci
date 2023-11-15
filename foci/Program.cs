using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.Linq;

namespace foci
{
    internal class Program
    {
        private static List<Merkozes> meccs = new();
        static void Main(string[] args)
        {
            FeladatKiir(1);
            FajlFeltoltSQL();
            Console.WriteLine("Adja meg a forduló számát: ");
            FeladatKiir(2, Feladat2(Convert.ToByte(Console.ReadLine())));
            FeladatKiir(3);
            Feladat3();
            FeladatKiir(4, "Kérem a csapat nevét:");
            string csnev=Console.ReadLine();
            FeladatKiir(5);
            Console.WriteLine( Feladat5(csnev));
            FeladatKiir(6);
            Console.WriteLine( Feladat6(csnev));
            FeladatKiir(7,"Adatok kiírása a stat.txt fájlba...");
            Feladat7();
            

        }



        static void Fajlfeltolt()
        {
            // meccs.Add(new Merkozes(Convert.ToByte(sor[0]), Convert.ToByte(sor[1]), Convert.ToByte(sor[2]), Convert.ToByte(sor[3]), Convert.ToByte(sor[4]), sor[5], sor[6]));
            try
            {
                var lines = File.ReadLines("meccs.txt").Skip(1);
                foreach (var line in lines)
                {
                    string[] sor = line.Split(' ');
                    meccs.Add(new Merkozes(Convert.ToByte(sor[0]), Convert.ToByte(sor[1]), Convert.ToByte(sor[2]), Convert.ToByte(sor[3]), Convert.ToByte(sor[4]), sor[5], sor[6]));


                }
                Console.WriteLine("Sikeres feltöltés");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Feltöltés sikertelen: {ex}");
            }



        }

        static void FajlFeltoltSQL()
        {
            string connStr = "server=localhost;userid=root;password=;database=foci";

            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                conn.Open();
                var sql = "SELECT * FROM eredmenyek";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    meccs.Add(new Merkozes(Convert.ToByte(rdr[0]), Convert.ToByte(rdr[1]), Convert.ToByte(rdr[2]), Convert.ToByte(rdr[3]), Convert.ToByte(rdr[4]), rdr[5].ToString(), rdr[6].ToString()));
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                conn.Close();
            }
            conn.Close();
        }




        static void FeladatKiir(byte fszam, string szoveg = "")
        {
            Console.WriteLine($"{fszam}. feladat:\t{szoveg}");
        }

        static string Feladat2(byte fszam)
        {
            return meccs[fszam].KiirMerkozesFormazva();
        }

        static void Feladat3()
        {
            //Query szintaxis

            //Console.WriteLine("//Query szintaxis:");
            //var fordulokEsCsapatok = meccs
            //.Where(m => (m.Hfelido < m.Vfelido && m.Hgol > m.Vgol) || (m.Vfelido < m.Hfelido && m.Vgol > m.Hgol))
            //.Select(m => new { m.Fordulo, GyoztesCsapat = m.Hgol > m.Vgol ? m.Hcsapat : m.Vcsapat });

            //foreach (var item in fordulokEsCsapatok)
            //{
            //    Console.WriteLine($"Forduló: {item.Fordulo}, Győztes csapat: {item.GyoztesCsapat}");
            //}




            //Metódus szintaxis

            var fordulokEsGyoztesCsapatok = from m in meccs
                                            where (m.Hfelido < m.Vfelido && m.Hgol > m.Vgol) ||
                                                  (m.Vfelido < m.Hfelido && m.Vgol > m.Hgol)
                                            select new { m.Fordulo, GyoztesCsapat = m.Hgol > m.Vgol ? m.Hcsapat : m.Vcsapat };
            Console.WriteLine("//Metódus szintaxis");
            foreach (var fegy in fordulokEsGyoztesCsapatok)
            {
                Console.WriteLine($"Forduló: {fegy.Fordulo}, Győztes csapat: {fegy.GyoztesCsapat}");
            }


        }

        static string Feladat5(string csnev)
        {

            //METÓDUS SZINTAXIS:
            //var golok = meccs.Where(m => m.Hcsapat == csnev || m.Vcsapat == csnev)
            //    .GroupBy(m => m.Hcsapat == csnev)
            //    .Select(g => new
            //    {
            //        LottGol = g.Sum(m => g.Key ? m.Hgol : m.Vgol),
            //        KapottGol = g.Sum(m => g.Key ? m.Vgol : m.Hgol)
            //    }).ToList();
            //var lottGolok = golok.Sum(e => e.LottGol);
            //var kapottGolok = golok.Sum(e => e.KapottGol);




            //QUERY SZINTAXIS:


            var golok = (from m in meccs
                         where m.Hcsapat == csnev || m.Vcsapat == csnev
                         group m by m.Hcsapat == csnev into g
                         select new
                         {
                             LottGol = g.Sum(m => g.Key ? m.Hgol : m.Vgol),
                             KapottGol = g.Sum(m => g.Key ? m.Vgol : m.Hgol)
                         }).ToList();

            var lottGolok = golok.Sum(e => e.LottGol);
            var kapottGolok = golok.Sum(e => e.KapottGol);





            return $"Lőtt:{lottGolok}\t Kapott:{kapottGolok}";
        }

        static string Feladat6(string csnev)
        {
            //METÓDUS SZINTAXIS:
            
            //var elsoVereseg = meccs
            //.Where(m => m.Hcsapat == csnev && m.Vgol > m.Hgol) // Kiválasztjuk azokat a meccseket, ahol a hazai csapat a keresett csapat és több gólt kapott, mint amennyit lőtt
            //.OrderBy(m => m.Fordulo) // Rendezzük a fordulók szerint
            //.FirstOrDefault(); // Az első ilyen rekordot vesszük, ha van
            //return elsoVereseg != null ? $"Az első otthoni vereség a(z) {elsoVereseg.Fordulo}. fordulóban volt, a(z) {elsoVereseg.Vcsapat} csapat ellen." : "A csapat otthon veretlen maradt.";





            //QUERY SZINTAXIS:
            var elsoVereseg = (from m in meccs
                               where m.Hcsapat == csnev && m.Vgol > m.Hgol
                               orderby m.Fordulo
                               select m).FirstOrDefault();




            return elsoVereseg != null ? $"Az első otthoni vereség a(z) {elsoVereseg.Fordulo}. fordulóban volt, a(z) {elsoVereseg.Vcsapat} csapat ellen.": "A csapat otthon veretlen maradt.";


        }

        static void Feladat7()
        {
            var eredmenyekStat = meccs
            .GroupBy(m => new { m.Hgol, m.Vgol })
            .Select(group => new
            {
                Eredmeny = $"{group.Key.Hgol}-{group.Key.Vgol}",
                Darab = group.Count()
            })
            .OrderByDescending(x => x.Darab)
            .ThenBy(x => x.Eredmeny)
            .ToList();

            using (StreamWriter sw = new StreamWriter("stat.txt"))
            {
                foreach (var eredmeny in eredmenyekStat)
                {
                    sw.WriteLine($"{eredmeny.Eredmeny}: {eredmeny.Darab} darab");
                }
            }

            Console.WriteLine("A statisztikák kiírása megtörtént a 'stat.txt' fájlba.");
        }


    }
}