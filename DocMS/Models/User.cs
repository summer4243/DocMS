using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DocMS
{
    public class User
    {
        public int id = -1;
        public string name;
        public string password;
        public string email;
        public int authority;
        public int corporation_id;
        public string corporation_name;
    }
}