const AUDIT_DELETE_PASSWORD = "2307";

export function confirmProtectedAuditDelete(auditName = "this audit") {
  const password = window.prompt(`Enter the administrator password to delete ${auditName}.`);

  if (password === null) return false;

  if (password !== AUDIT_DELETE_PASSWORD) {
    window.alert("Incorrect password. Please contact the site administrator.");
    return false;
  }

  return window.confirm(`Permanently delete ${auditName}? This cannot be undone.`);
}
