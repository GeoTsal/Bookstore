
package bookstore.service;

import bookstore.entity.Author;
import bookstore.entity.Bookdetails;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookdetailsRepo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookdetailsService {
    
    @Autowired
    AuthorRepo authorRepo;
    
    @Autowired
    BookdetailsRepo bookdetailsRepo;
    
    public List<Bookdetails> findBooksdetailsFromSameAuthor(int bookid) {
        List <Author> authors=authorRepo.findByBook(bookid);
        List<Bookdetails> booksdetails= new ArrayList<>();
        for (int i=0; i<authors.size(); i++)  {
            List<Bookdetails> b=bookdetailsRepo.findBooksdetailsFromSameAuthor(i,bookid);
            booksdetails.addAll(b);
        }
        return booksdetails;
    }
}