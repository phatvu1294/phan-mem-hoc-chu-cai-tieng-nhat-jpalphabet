# Phần mềm JPAlphabet
*Phần mềm JPAlphabet được viết bằng ngôn ngữ Delphi trên Delphi XE2*

### Giới thiệu
Chắc hẳn với những ai đã từng học bảng chữ cái tiếng nhật thì cảm giác ban đầu đều cảm thấy rất khó, cá nhân mình cũng vậy... Càng khó khăn hơn khi phải luyện viết và nhận dạng chữ một mình... Nhằm giải quyết vấn đề đó, mình đã viết phần mềm này để giúp cho các bạn học bảng chữ cái tiếng nhật một cách dễ dàng hơn.

![Phần mềm JPAlphabet](/images/image-01.png)

### Hướng dẫn sử dụng

#### Alphabet - Bảng chữ cái tiếng nhật cơ bản

Ở tab này cung cấp cho chúng ta một hệ thống bảng chữ cái tiếng nhật được sắp xếp một cách đơn giản nhất để dễ học nhất, sự ghép nhau giữa các hàng và cột sẽ làm chúng ta dễ nhớ hơn...

Nhấp chọn vào **Hiragana** hoặc **Katakana** trong **Alphabet Type** để hiển thị bảng chữ cái bạn cần muốn xem.

Nhấp chọn vào một chữ cái bất kỳ để xem chữ cái và âm tiết của chúng, nếu không muốn phát âm thanh khi chọn hãy bỏ chọn **Enable Sound** trong **Alphabet Option**.

#### Alphabet Quiz - Luyện nhận dạng mặt chữ và luyện viết bảng chữ cái

![Phần mềm JPAlphabet](/images/image-02.png)

Ở tab này cung cấp cho chúng ta các công cụ để hỗ trợ nhận dạng và luyện viết chữ...

Đầu tiên là **Quiz Source**, tại đây chúng ta sẽ lựa chọn nguồn dữ liệu để luyện tập, sử dụng **Select All** hoặc **Deselect All** để lựa chọn nhanh.

Tiếp theo là **Quiz Option**, nó cung cấp cho chúng ta các tùy chọn:
- **Limited time ... second**, giới hạn thời gian để trả lời câu hỏi hoặc thời gian để chuyển sang câu khác. Tích chọn và nhập vào một thời gian mà bạn muốn, tối đa là 9999 và tối thiểu là 1. Nếu bỏ chọn thì thời gian sẽ được đặt là không giới hạn.
- **Get answer before ... second**, lấy câu trả lời trước một thời gian mà bạn định sẵn. Tùy chọn này chỉ sẵn sàng nếu như tùy chọn Limited time được tích chọn. Tích chọn và nhập vào một thời gian bạn muốn, tối đa là thời gian của Limited time và tối thiểu là 1.
- **Pasue if "Get" button pressed**, Tạm dừng nếu nút "Get" được nhấn. Tùy chọn này chỉ sẵn sàng nếu như tùy chọn Limited time được tích chọn. Nó cho phép dừng bộ đếm thời gian để bạn có thời gian xem lại kết quả, lúc này nhấn Next để tiếp tục.
- **Get answer with sound**, Tùy chọn này chỉ sẵ sàng cho Hiragana practice và Katakana practice. Nếu tích chọn, nó sẽ lấy câu trả lời cùng với âm thanh.

Cuối cùng là **Quiz Type**, tại đây chúng ta sẽ lựa chọn kiểu để luyện tập gồm có hai dạng chính là, nhận dạng và luyện nhớ viết:
- **Hiragana practice** và **Katakana practice**, luyện nhận dạng Hiragana và Katakana, với loại này chương trình sẽ tự tạo một chữ cái ngẫu nhiên bất kỳ từ **Quiz Source** và hiển thị thành câu hỏi, việc của bạn là hãy nhập vào âm tiết (romanji) của chữ cái đó, nhấn **Enter** hoặc nhấp **Next** để xác thực, nếu bạn có câu trả lời đúng bạn sẽ được tăng số câu đúng trong **Right**, còn nếu bạn có câu trả lời sai, thì bạn sẽ được tăng số câu sai trong **Wrong** và chữ cái sai đó sẽ được lưu lại trong **Wrong list**. Bạn có thể xem lại nó sau khi dừng Quiz.
- **Writing practice Hiragana** và **Writing practice Katakana**, luyện nhớ và viết chữ, chương trình sẽ tạo phát ra âm thanh của một âm tiết (romanji) bất kỳ từ **Quiz Source**, nhiệm vụ của bạn là chuẩn bị giấy và viết nó ra, nhấn **Get** để xem kết quả hoặc **Next** để chuyển câu tiếp. Bạn nên dùng **Limited time** để nó tự chuyển.

Cuối cùng nhấn **Start** để bắt đầu hoặc **Stop** để dừng. hãy nhớ rằng, với cả bốn loại trên thì **Quiz Option** đều được áp dụng.
