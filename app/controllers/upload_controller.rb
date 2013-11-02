class UploadController < ApplicationController

   # http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm
   
   # 呈現上傳檔案的表單
   def index
      render :file => 'app/views/upload/uploadfile.rhtml'
   end

   # 另外實作已經上傳的檔案清單
   def list
   end

   # 實際儲存檔案
   def uploadFile
      # save 這個函式寫在 model 中。
      post = DataFile.save(params[:upload])
      render :text => "File has been uploaded successfully"
   end

   # 將所有非英文字母的檔名替換成底線
   def sanitize_filename(file_name)
        # get only the filename, not the whole path (from IE)
        just_filename = File.basename(file_name) 
        # replace all none alphanumeric, underscore or perioids
        # with underscore
        just_filename.sub(/[^\w\.\-]/,'_') 
   end

   # 刪除檔案
   def cleanup
       File.delete("#{RAILS_ROOT}/dirname/#{@filename}") 
       if File.exist?("#{RAILS_ROOT}/dirname/#{@filename}")
       end
   end

end
