import { createClient } from "@supabase/supabase-js";
import { DEFAULT_COMMISSIONING_ENGINEER } from "../../../lib/constants";

async function getCommissioningEngineer(boatId) {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || "https://zlbzipopreklfnmaczbu.supabase.co";
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  if (!boatId || !supabaseUrl || !supabaseAnonKey) {
    return DEFAULT_COMMISSIONING_ENGINEER;
  }

  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey);
    const { data, error } = await supabase
      .from("boats")
      .select("commissioning_engineer")
      .eq("id", boatId)
      .single();

    if (error) {
      return DEFAULT_COMMISSIONING_ENGINEER;
    }

    return data?.commissioning_engineer || DEFAULT_COMMISSIONING_ENGINEER;
  } catch (_error) {
    return DEFAULT_COMMISSIONING_ENGINEER;
  }
}

export default async function BoatLayout({ children, params }) {
  const engineer = await getCommissioningEngineer(params?.boatId);

  return (
    <>
      <div
        style={{
          background: "#0b2d49",
          color: "#fffdf8",
          fontFamily: "Courier New, Courier, monospace",
          fontSize: "12px",
          fontWeight: 700,
          letterSpacing: "0.08em",
          padding: "10px 20px",
          textAlign: "center",
          textTransform: "uppercase"
        }}
      >
        Commissioning Engineer: {engineer}
      </div>
      {children}
    </>
  );
}
