"use client";

import React, { useState, useEffect, ChangeEvent } from "react";
// @ts-ignore
import axios from "axios";
import styles from "./page.module.css"; // 동일 폴더의 CSS 모듈 import

interface User {
  id: number;
  name: string;
  email: string;
}

const API_URL = "/api/users";

export default function Home() {
  const [users, setUsers] = useState<User[]>([]);
  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");

  // 사용자 목록 가져오기
  useEffect(() => {
    axios
        .get<User[]>(API_URL)
        .then((response: { data: React.SetStateAction<User[]>; }) => setUsers(response.data))
        .catch((error: any) => console.error("Error fetching users:", error));
  }, []);

  // 사용자 추가하기
  const addUser = () => {
    if (!name || !email) {
      alert("이름과 이메일을 입력하세요.");
      return;
    }

    axios
        .post<User>(API_URL, { name, email })
        .then((response: { data: User; }) => {
          setUsers([...users, response.data]);
          setName("");
          setEmail("");
        })
        .catch((error: any) => console.error("Error adding user:", error));
  };

  return (
      <div className={styles.container}>
        <h1 className={styles.title}>👥 Student List</h1>
        <div className={styles.inputContainer}>
          <input
              type="text"
              value={name}
              onChange={(e: ChangeEvent<HTMLInputElement>) => setName(e.target.value)}
              placeholder="Enter name"
              className={styles.input}
          />
          <input
              type="email"
              value={email}
              onChange={(e: ChangeEvent<HTMLInputElement>) => setEmail(e.target.value)}
              placeholder="Enter email"
              className={styles.input}
          />
          <button onClick={addUser} className={styles.button}>
            Add User
          </button>
        </div>
        <ul className={styles.userList}>
          {users.map((user) => (
              <li key={user.id} className={styles.userCard}>
                <strong>{user.name}</strong> <span>{user.email}</span>
              </li>
          ))}
        </ul>
      </div>
  );
}
