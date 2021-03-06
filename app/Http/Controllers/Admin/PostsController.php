<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Post;
use App\Category;
use App\Images;
use App\SubCategory;
use Illuminate\Http\Request;
use Auth;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        
        $keyword = $request->get('search');
        $perPage = 25;

        if (!empty($keyword)) {
            $posts = Post::with('mycategory','mysubcategory')->where('title', 'LIKE', "%$keyword%")
                ->orWhere('description', 'LIKE', "%$keyword%")
                ->orWhere('category', 'LIKE', "%$keyword%")
                ->orWhere('subcategory', 'LIKE', "%$keyword%")
                ->orWhere('price', 'LIKE', "%$keyword%")
                ->orWhere('location', 'LIKE', "%$keyword%")
                ->orWhere('lat', 'LIKE', "%$keyword%")
                ->orWhere('long', 'LIKE', "%$keyword%")
                ->orWhere('youtube_link', 'LIKE', "%$keyword%")
                ->paginate($perPage);
        } else {
            $posts = Post::with('mycategory','mysubcategory')->paginate($perPage);           
        }

        return view('admin.posts.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $category=Category::get();
        return view('admin.posts.create',array('category'=>$category));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        $requestData = $request->all();
        $requestData['user_id']=Auth::user()->id;
        $post=Post::create($requestData);
        if(!empty($request->file('images'))){  
             foreach($request->file('images') as $k=>$file){
                $extension = $file->getClientOriginalExtension();
                $filename =  $file->getFilename().'.'.$extension;
                if($file->move(public_path('/posts'),$filename)){
                    $ImagesData['moduleId']=$post->id;
                    $ImagesData['images']='/posts/'.$filename;
                    $ImagesData['type']="post";
                    Images::create($ImagesData); 
                }   
             }          
        }
        return redirect('admin/posts')->with('flash_message', 'Post added!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $post = Post::with('mycategory','mysubcategory','postimages')->findOrFail($id);
        return view('admin.posts.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $post = Post::findOrFail($id);
        $category=Category::get();
        return view('admin.posts.edit', compact('post','category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update(Request $request, $id)
    {
        
        $requestData = $request->all();        
        $post = Post::findOrFail($id);
        $post->update($requestData);
        if(!empty($request->file('images'))){  
             foreach($request->file('images') as $k=>$file){
                $extension = $file->getClientOriginalExtension();
                $filename =  $file->getFilename().'.'.$extension;
                if($file->move(public_path('/posts'),$filename)){
                    $ImagesData['moduleId']=$post->id;
                    $ImagesData['images']='/posts/'.$filename;
                    $ImagesData['type']="post";
                    Images::create($ImagesData); 
                }   
             }          
        }

        return redirect('admin/posts')->with('flash_message', 'Post updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        Post::destroy($id);

        return redirect('admin/posts')->with('flash_message', 'Post deleted!');
    }
}
