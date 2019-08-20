<?php

namespace App\Controllers\Auth;

use App\Controllers\Controller;
use App\Models\User;
use App\Models\Skill;
use App\Models\SkillUser;
use Respect\Validation\Validator as v;

class AuthController extends Controller
{
    
    /**
    * Sign user out
    *
    *
    */
    public function getSignout($request, $response)
    {
        $this->auth->logout();
        $this->flash->addMessage('success', 'Logout successful'); //You can also use error, info, warning
        
        return $response->withRedirect($this->router->pathFor('auth.signin'));
    }
    
    
    /**
    * Display sign in page
    *
    * @return
    */
    public function signin($request, $response)
    {
        if ($request->isPost()) {

            //Attempt to log user in
            $auth = $this->auth->attempt(
                $request->getParam('email'),
                $request->getParam('password')
            );
            
            //if login fails
            if (!$auth) {
                $this->flash->addMessage('error', 'Login Failed!'); //You can also use error, info, warning
                return $response->withRedirect($this->router->pathFor('auth.signin'));
            };
            
            $this->flash->addMessage('success', 'Login successful!'); //You can also use error, info, warning
            
            return $response->withRedirect($this->router->pathFor('home'));
        }

        return $this->view->render($response, 'auth/signin.twig');
    }
    
    /**
    * Render Signin up
    * @param get $request
    *
    *
    * @return
    */
    public function getSignup($request, $response)
    {
        return $this->view->render($response, 'auth/signup.twig');
    }
    
    /**
    * Sign this user up
    * @param post $request items to be saved in databse
    *
    * @return
    */
    
    public function postSignup($request, $response)
    {
        
        /**
        * validate input before submission
        * @var
        *
        */
        $validation = $this->validator->validate($request, [
            'email' => v::noWhitespace()->notEmpty(),
            'first_name' => v::notEmpty()->alpha(),
            'last_name' => v::notEmpty()->alpha(),
            'password' => v::notEmpty(),
        ]);
        
        //redirect if validation fails
        if ($validation->failed()) {
            $this->flash->addMessage('error', 'Signup Failed!'); //You can also use error, info, warning
        
            return $response->withRedirect($this->router->pathFor('auth.signup'));
        }
        
        
        $user = User::firstOrCreate([
            'first_name' => $request->getParam('first_name'),
            'last_name' => $request->getParam('last_name'),
            'email' => $request->getParam('email'),
            //harsh password with PHPs inbuilt password harsher
            'password' => password_hash($request->getParam('password'), PASSWORD_DEFAULT) //PASSWORD_BCRYPT is also available
        ]);
        
        // get each skill from skills textfield and save them in the database
        // $skills = str_replace(' ', '', $request->getParam('skills'));
        $skillList = explode(',', $request->getParam('skills'));

        foreach ($skillList as $skill) {
            // save in the skills table
            $getSkill = Skill::firstOrCreate([
                                'name' => trim($skill)
                                ]);
            SkillUser::create([
                'user_id' => $user->id,
                'skill_id' => $getSkill->id
            ]);
        }

        $this->flash->addMessage('success', 'Signup successful'); //You can also use error, info, warning
        
        
        //sign user in after they've signed up
        $this->auth->attempt($request->getParam('email'), $request->getParam('password')); //using $user->password will not work because the password is already hashed.
        
        return $response->withRedirect($this->router->pathFor('home'));
    }
}
