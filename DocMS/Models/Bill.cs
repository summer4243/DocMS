using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DocMS
{
    public class Bill
    {
        public int id = -1;
        public DateTime time;
        public int day;
        public float price;
        public int status;
        public int corporation_id;
    }
}