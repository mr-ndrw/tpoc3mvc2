CREATE TABLE [dbo].[Authors] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [Title]   NVARCHAR (MAX) NULL,
    [Content] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Authors] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Books] (
    [Id]    INT            IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (MAX) NULL,
    [Isbn]  NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[BookAuthors] (
    [Book_Id]   INT NOT NULL,
    [Author_Id] INT NOT NULL,
    CONSTRAINT [PK_dbo.BookAuthors] PRIMARY KEY CLUSTERED ([Book_Id] ASC, [Author_Id] ASC),
    CONSTRAINT [FK_dbo.BookAuthors_dbo.Books_Book_Id] FOREIGN KEY ([Book_Id]) REFERENCES [dbo].[Books] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.BookAuthors_dbo.Authors_Author_Id] FOREIGN KEY ([Author_Id]) REFERENCES [dbo].[Authors] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Book_Id]
    ON [dbo].[BookAuthors]([Book_Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Author_Id]
    ON [dbo].[BookAuthors]([Author_Id] ASC);

CREATE TABLE [dbo].[Categories] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[CategoryBooks] (
    [Category_Id] INT NOT NULL,
    [Book_Id]     INT NOT NULL,
    CONSTRAINT [PK_dbo.CategoryBooks] PRIMARY KEY CLUSTERED ([Category_Id] ASC, [Book_Id] ASC),
    CONSTRAINT [FK_dbo.CategoryBooks_dbo.Categories_Category_Id] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.CategoryBooks_dbo.Books_Book_Id] FOREIGN KEY ([Book_Id]) REFERENCES [dbo].[Books] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Category_Id]
    ON [dbo].[CategoryBooks]([Category_Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Book_Id]
    ON [dbo].[CategoryBooks]([Book_Id] ASC);

CREATE TABLE [dbo].[Reviews] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [AuthorName] NVARCHAR (MAX) NULL,
    [Title]      NVARCHAR (MAX) NULL,
    [BookId]     INT            NOT NULL,
    CONSTRAINT [PK_dbo.Reviews] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Reviews_dbo.Books_BookId] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_BookId]
    ON [dbo].[Reviews]([BookId] ASC);


SET IDENTITY_INSERT [dbo].[Authors] ON
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (1, N'Max Power', N'Canada')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (2, N'Max Rockatansky', N'USA')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (3, N'Julian Assange', N'Sweden')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (4, N'Yanis Foukarakis', N'Greece')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (5, N'Slavoj Zizek', N'Slovenia')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (6, N'Hillary Clinton', N'USA')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (7, N'Albert Camus', N'France')
INSERT INTO [dbo].[Authors] ([Id], [Title], [Content]) VALUES (8, N'John Le Carre', N'United Kingdom')
SET IDENTITY_INSERT [dbo].[Authors] OFF

SET IDENTITY_INSERT [dbo].[Books] ON
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (1, N'Java is Nice', N'159483357')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (2, N'C# is also Nice', N'345235234')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (3, N'C++ is a mediocore', N'352234454')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (4, N'I like Python', N'234665478')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (5, N'Haskell is good', N'156923023')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (6, N'Scala is better', N'344759023')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (7, N'Hello World', N'348589349')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (8, N'Big World', N'134133333')
INSERT INTO [dbo].[Books] ([Id], [Title], [Isbn]) VALUES (9, N'Assange and Assange', N'230103949')
SET IDENTITY_INSERT [dbo].[Books] OFF

INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (1, 1)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (2, 1)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (8, 1)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (1, 2)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (1, 3)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (9, 3)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (6, 4)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (3, 5)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (9, 5)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (5, 6)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (7, 6)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (5, 7)
INSERT INTO [dbo].[BookAuthors] ([Book_Id], [Author_Id]) VALUES (4, 8)

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Nice Books')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Bad Books')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Hello Books')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Max Books')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Best Books')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Why Books')
SET IDENTITY_INSERT [dbo].[Categories] OFF

INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (1, 1)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (2, 1)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (3, 1)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (1, 2)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (4, 2)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (1, 4)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (6, 4)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (4, 5)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (5, 6)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (4, 7)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (5, 7)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (5, 8)
INSERT INTO [dbo].[CategoryBooks] ([Category_Id], [Book_Id]) VALUES (2, 9)

SET IDENTITY_INSERT [dbo].[Reviews] ON
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (1, N'Sad Person', N'I don''t like this book.', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (2, N'Happy Person', N'I like this', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (3, N'Person Person', N'Good', 2)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (4, N'Hi Person', N'nice', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (7, N'Max Person', N'Max !', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (8, N'Sad Person', N'I don''t like this book.', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (9, N'Happy Person', N'I like this', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (10, N'Person Person', N'Good', 4)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (11, N'Hi Person', N'nice', 5)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (12, N'Max Person', N'Max !', 6)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (13, N'Sad Person', N'I don''t like this book.', 7)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (14, N'Happy Person', N'I like this', 8)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (15, N'Person Person', N'Good', 9)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (16, N'Hi Person', N'nice', 2)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (17, N'Max Person', N'Max !', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (18, N'Sad Person', N'I don''t like this book.', 4)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (19, N'Happy Person', N'I like this', 5)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (20, N'Person Person', N'Good', 6)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (21, N'Hi Person', N'nice', 7)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (22, N'Max Person', N'Max !', 9)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (23, N'Sad Person', N'I don''t like this book.', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (24, N'Happy Person', N'I like this', 2)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (25, N'Person Person', N'Good', 2)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (26, N'Hi Person', N'nice', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (27, N'Max Person', N'Max !', 4)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (28, N'Sad Person', N'I don''t like this book.', 5)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (29, N'Happy Person', N'I like this', 9)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (30, N'Person Person', N'Good', 4)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (31, N'Hi Person', N'nice', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (32, N'Max Person', N'Max !', 1)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (33, N'Sad Person', N'I don''t like this book.', 2)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (34, N'Happy Person', N'I like this', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (35, N'Person Person', N'Good', 6)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (36, N'Hi Person', N'nice', 7)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (37, N'Max Person', N'Max !', 8)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (38, N'Sad Person', N'I don''t like this book.', 9)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (39, N'Happy Person', N'I like this', 4)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (40, N'Person Person', N'Good', 3)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (41, N'Hi Person', N'nice', 6)
INSERT INTO [dbo].[Reviews] ([Id], [AuthorName], [Title], [BookId]) VALUES (42, N'Max Person', N'Max !', 9)
SET IDENTITY_INSERT [dbo].[Reviews] OFF


