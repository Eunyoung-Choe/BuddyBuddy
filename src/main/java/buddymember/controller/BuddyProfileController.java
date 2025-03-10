package buddymember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardFileDto;
import data.dto.BuddyMemberDto;
import data.service.BoardFileService;
import data.service.BuddyMemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;

@Controller
@RequiredArgsConstructor
public class BuddyProfileController {
	final NcpObjectStorageService storageService;
	final BoardFileService fileService;
	private String bucketName = "bitcamp-bucket-149";
	
    @Autowired
    BuddyMemberService buddyMemberService;

    @GetMapping("/profile")
    public String goProfile(HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 ID 가져오기
        String uid = (String) session.getAttribute("loginid");
        if (uid == null) {
            return "redirect:/login"; // 로그인 안 했으면 로그인 페이지로 이동
        }

        // 사용자 정보 가져오기
        BuddyMemberDto dto = buddyMemberService.getSelectByUid(uid);
        
        // 모델에 사용자 정보 추가
        model.addAttribute("dto", dto); // ${dto.~}
        model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/bitcamp-bucket-149");

        return "profile/profile"; // profile.jsp로 이동
    }
    
    
    
    // 미리보기로 본 사진 lobby.jsp로 보내기
    @PostMapping("/profile")
    @ResponseBody
    public String updateProfile (
    		@ModelAttribute BuddyMemberDto dto,
    		@RequestParam("profileImage") MultipartFile profileImage,
    		HttpSession session,
    		Model model
    		)
    {
    	String uid = (String)session.getAttribute("loginid"); // 우변 자체가 Object타입이라 uid가 String인 것과 별개로 형변환 해줘야 함.
    	String upass = (String)session.getAttribute("loginpass");
    	String uname = buddyMemberService.getSelectByUid(uid).getUname();
    	
    	dto.setUname(uname);
    	dto.setUid(uid);
    	dto.setUpass(upass);
    	
    	
    	if(!profileImage.isEmpty())
		{
    		
    		String filename = storageService.uploadFile(bucketName, "buddy", profileImage);
    		System.out.println(filename);
    		dto.setUprofile(filename);

			return filename;
		}
    	
    	return "";
    	
    	
    }
    
    
    
    
}
