/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookdetailsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BookController {
    @Autowired
    BookdetailsRepo bookdetailsRepo;
    
    @Autowired
    BookdetailsService bookdetailsService;
    
    @Autowired
    AuthorRepo authorRepo;
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @GetMapping("books/search/{bookid}")
    public String getSpecificBook(@PathVariable("bookid") int id, Model model) {
        
        Bookdetails bookdetails = bookdetailsRepo.findByBookId(id);
        model.addAttribute("bookdetails", bookdetails);

        List<Author> authorsByBook = authorRepo.findByBook(id);
        model.addAttribute("authorsByBook", authorsByBook);

         List<Bookdetails> booksdetailsFromSameAuthor= bookdetailsService.findBooksdetailsFromSameAuthor(id);
         model.addAttribute("booksdetailsFromSameAuthor",booksdetailsFromSameAuthor);
         
        String bookTitle = bookdetails.getBook().getTitle();
        List<Bookdetails> SameBooksDifFormat = bookdetailsRepo.findSameBooksDifFormat(id, bookTitle);
        model.addAttribute("SameBooksDifFormat", SameBooksDifFormat);

        List<Category> categByBook = categoryRepo.findByBook(id);
        model.addAttribute("categByBook", categByBook);

        return "specificBook";
    }
}
