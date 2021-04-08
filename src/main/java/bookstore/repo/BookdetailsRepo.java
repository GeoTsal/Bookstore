/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface BookdetailsRepo extends JpaRepository<Bookdetails,Integer> {
    
    @Query(value="select bookdetails.* from bookdetails where bookdetails.bookid=?1 and bookdetails.format!=?2", nativeQuery = true)
    List<Bookdetails> findBooksSameIdDifFormat( int bookid, int format);
    
     @Query(value="select bookdetails.* from book,bookdetails,format where book.bookid = bookdetails.bookid and format.formatid = bookdetails.formatid"
      + " and book.bookid =?1 and format.formatid=?2", nativeQuery = true)
      Bookdetails findByBookidandFormatid(int bookid, int formatid);  
    
    @Query(value="select bookdetails.* from bookdetails,book where bookdetails.bookid=book.bookid and book.bookid=?1", nativeQuery= true)
    Bookdetails findByBookId(int bookid);
    
    @Query(value="select bookdetails.* from bookdetails,book,joinedbookauthor where joinedbookauthor.authorid=?1 and joinedbookauthor.bookid !=?2", nativeQuery= true)
    List<Bookdetails> findBooksdetailsFromSameAuthor(int authorid,int bookid);
    
}
