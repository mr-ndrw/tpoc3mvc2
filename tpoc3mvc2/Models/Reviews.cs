namespace tpoc3mvc2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Reviews
    {
        public int Id { get; set; }

        public string AuthorName { get; set; }

        public string Title { get; set; }

        public int BookId { get; set; }

        public virtual Books Books { get; set; }
    }
}
