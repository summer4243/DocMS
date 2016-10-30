using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DocMS.Models
{
    public class UserRecord
    {
        public int id = -1;
        public DateTime time;
        public int type;
        public string ip;
        public int user_id;
        public int book_id;
    }
}