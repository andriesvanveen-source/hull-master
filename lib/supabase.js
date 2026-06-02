"use client";

import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || "https://zlbzipopreklfnmaczbu.supabase.co";
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

export const isSupabaseConfigured = Boolean(supabaseUrl && supabaseAnonKey);

export const supabase = isSupabaseConfigured
  ? createClient(supabaseUrl, supabaseAnonKey)
  : null;

export function getSupabaseConfigurationError() {
  if (isSupabaseConfigured) {
    return "";
  }

  return "Missing NEXT_PUBLIC_SUPABASE_ANON_KEY. Add your Supabase anon public key to .env.local and redeploy.";
}
