
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.repo.AuthorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorController {
    
    @Autowired
    AuthorRepo authorRepo;
    
     @GetMapping("/{authorId}")
   public String showSpecificAuthor(@PathVariable("authorId") int authorId , Model model){
         Author author=authorRepo.findByAuthorid(authorId);
         model.addAttribute("author",author);
         return "specificAuthor";  
   }
}
