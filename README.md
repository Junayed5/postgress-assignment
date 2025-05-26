## Question Answering...

### 1. What is PostgreSQL?

Ans:- PostgreSQL হল ব্যাকেন্ড ডাটাবেজ যা ডায়নামিক ওয়েব এপ্লিকেশন তৈরিতে সহযোগিতা করে এবং এটি একটি  ওপেন সোর্স ডাটাবেজ যা রিলেশনাল এবং নন রিলেশনাল উভয়ই কুয়ারি সাপোর্ট করে।

### 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Ans:- Primary key হল একটি টেবিল এর প্রধান উপাদান যা ডাটা আলাদাভাবে চিহ্নিত করতে সহযোগিতা করে, আর অন্যদিকে Foreign key হল অন্য টেবিলের primary key কে সংরক্ষন করে ওই টেবিলের সাথে সম্পর্ক স্থাপনে সহযোগিতা করে। 

### 3. What is the difference between the VARCHAR and CHAR data types?

Ans:- VARCHAR এবং CHAR এর মধ্যে পার্থক্য হল CHAR এর ক্ষেত্রে যে লেন্থ টা বলে দেয়া হয় সেটা সে ফিক্সট লেন্থ জায়গা নিয়ে রাখে যদিও সেখানে কম লেন্থ এর ডাটাও থাকে অন্যদিকে VARCHAR এর ক্ষেত্রে যে লেন্থটা দেয়া হয় সেটাকে সে সর্বচ্চো লেন্থ হিসেবে গণ্য করে যতটুকু ডাটা পায় ততটুকু জায়গা নিয়ে নেয়। 

### 4. What are the LIMIT and OFFSET clauses used for?

Ans:- LIMIT clause হল কতগুলো সারির ডাটা প্রয়োজন তা বলে দেয়ার মাধ্যমকে LIMIT clause বলে। উদাহরণঃ LIMIT 10 এর মানে হল 1 - 10 পর্যন্ত সারি রিটার্ন করবে। 
আর OFFSET হল এর মান যত দেয়া হবে সমপরিমাণ ডাটা স্কিপ করে পরবর্তী থেকে ডাটা নেয়া শুরু করবে। যেমনঃ OFFSET 20 এর মানে হল প্রথম ২০ টা ডাটা বাদ দিয়ে পরবর্তী থেকে শুরু হবে।

### 5. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

Ans:- COUNT()--> এটা টেবিল এর সমস্ত সারিগুলোর সমষ্টি বের করতে সাহায্য করে। যেমনঃ COUNT(*) 
SUM()--> এটা টেবিল এর কলাম এর মান এর  যোগফল বের করতে সাহায্য করে। যেমনঃ SUM(col_name) 
AVG()-->  এটা টেবিল এর কলাম এর মান এর গড় সংখ্যা নির্ণয় করতে সাহায্য করে। যেমনঃ AVG(col_name) 