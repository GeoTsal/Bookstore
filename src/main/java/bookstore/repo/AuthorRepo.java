
package bookstore.repo;

import bookstore.entity.Author;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Σταθης Καράμπελας
 */
@Repository
public interface AuthorRepo extends JpaRepository<Author, Integer> {
   
    @Override
    public List<Author> findAll();
    
    
    public Author findByAuthorid(int authorid);
    
    @Query(value="select author.* from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid"
            + " and book.bookid=joinedbookauthor.bookid and book.bookid=?1 ",nativeQuery = true)
    List<Author> findByBook(int bookid);
    
    @Query(value= "select book.* from book, author where joinedbookauthor.bookid=book.bookid and joinedbookauthor.authorid=author.authorid "
            + "and book.")
}


