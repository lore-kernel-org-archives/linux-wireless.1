Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108079;
	b=Ods/6KBphHUjXC8tO4gkLjkP2F+/YLfhRZi4iG63FkAuesm8dDC6Js/8Yq8SJx4q3VqS
	 26rcGLFyR2KeUoSq7pGrQ5nZw2RqHor4/vZ8TYg3RB4VTGm2AhwnNHD3whAIz9Mmn5XqL
	 kZnNtcDh4SZq+yNdax0bnBYobWV/ZW4dlPSkhB8kL4dwQe0rsigHadxqYP/f1IkfDrXgJ
	 9rcJg5vpb9QegjI1kp3zBvUXOIfQpDmqn4CPlCKfRzisDp85MSwaUL10nxsKcLjb2kQu9
	 bYJqUnOcmts79NIAVM9iy2osl6drDyUcqMBf9mbivyUI184AZGyZ7+QqnWsWNufCYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
	b=4MCpQizZSbA98+PigccRVKhYbdpd89OLf63QA58yF28jKsshdEVcAX7VxxPqqwNYJOJp
	 j4WzPlvT19KJlEWpNaTRkivDDNrI4O0zbhfbBy8xSJVEKqQGpekKNDiObC5p6tkLKxBLb
	 r5WRN6Zzzz/fw7qItPX09pkhn5acFI4c1pwJz7ew8DSC5+xOzoamxXEdhJ+axkR3PnXnb
	 7D7ZNnpjqYrOO4M74r4Hshlj8+9+AlKzoWPNHvjnzAyjHvFjxkiB3bF6kjk4N6osHy1i7
	 t6iL0ZmJ06MoCTvcwfG3kLAZjv4BvlrB3rKKT1XoUTidMedCIpha+Hc7jLzK+AQnytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TTvmgVHD;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15695606A32F
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15695606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TTvmgVHD
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3821eb27024so3090374eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108077; x=1795712877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
        b=TTvmgVHDNHKMuCCpFioq684nUSVdthmULWTpF2K0HCmsU5KRxTQXg0RxBmFTIUq9Md
         IWiIANFH7iAbaurlbdR7HBR8TjljgOCldeyV+4cF8niYRaM6VbDIS2J2P9zVkBYoDDIH
         RM43e9NORuGJy1RWBiftDngOhT1xtbJNcxt8Aqx7fTslhTeHXLqlgQcgeSY5S258BNr/
         O1wGI1FiWqbrXwTltorpokE+tmjK3BEgULhfeWLUuUVVcmZpmuDBO6hXMKXviW+TX9FQ
         +T4M6fYBKtfLISnJuqaujxg2sBoEixoKmEQ3eA6hP0n1EXgguG99fhv3g5wik0Zb77Zl
         TGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108077; x=1795712877;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
        b=KpCY+EjCj8tEwyCqTKLdFpDa6J9a4twxFl6dnqjqg0OzhaWSPQYCtw+W7lBx8jaKkX
         7JtPsWKOtrjqXzX/FYPAODQWtPXcQFz47HNfX68ztdDud4JPKa3PCkWSXyUV+5yFH5pk
         Tp2u98TbePT1MGMmmHAk10RXvcngXmWIIGcjVoVkTvXwbKX1gfq9SQoN0DZM8H/zgne5
         gf/NyEYEMguf/cklOMyNo74ojwj8hxTmvZvcZphX+Q1JGXaZymu2Ms9Sd/ihncNBNxLs
         nH4lvI+3XOSCeUNpVSjkyYPy56kQefXJG/g+/0YzzqcN51Fxg682IjuFZZETsjqM0Z2j
         Tliw==
X-Gm-Message-State: APuU4Z+YS42ZoUAlwrNCl89IoUDFaEvbUanV5/YXbzwiHFfGlbkQn3nI
	O1Hb08DWQS2Tc8zRBa4Fi1K//G8wJQlCWv4PrcZbNU7zU7Zt8gF/XhOceEmzdgY4WzT5VHewgKf
	uZgd3hWceUg==
X-Received: from dyjp21.prod.google.com ([2002:a05:7300:4615:b0:351:1933:2028])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc05:b0:36d:4560:dd38
 with SMTP id 5a478bee46e88-38281cf6398mr7088098eec.37.1795108076745; Thu, 19
 Nov 2026 09:07:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:53 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170753.1526210-1-irogers@google.com>
Subject: [PATCH] wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C
 command IDs
From: Ian Rogers <irogers@google.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rtl8821ae, rtl8192ee, and rtl8188ee, the H2C power-save command enums
define 0x20, 0x21, 0x22, 0x23 followed by 'H2C_*_P2P_PS_OFFLOAD = 024'.
The missing 'x' makes 024 an octal constant (decimal 20, 0x14) instead of
0x24 (decimal 36, matching H2C_8723B_P2P_PS_OFFLOAD = 0x24 in rtl8723be
and rtl8xxxu), sending the wrong H2C command ID to firmware during Wi-Fi
Direct P2P power-save offload updates.

Change 024 to 0x24 in all three headers.

Found via inspection of H2C command enums during an x86_64 LLVM=1
(Clang 21.1.8) allyesconfig warning audit; fix and changelog drafted with
an AI coding assistant. Build-tested under LLVM=1 W=1 (-Werror); not
tested on Realtek Wi-Fi hardware.

Fixes: f0eb856e0b6c ("rtlwifi: rtl8188ee: Add new driver")
Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
Fixes: b1a3bfc97cd9 ("rtlwifi: rtl8192ee: Move driver from staging to the regular tree")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
index 79f095e47d71..583e1c51c5c9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
@@ -127,7 +127,7 @@ enum rtl8188e_h2c_cmd {
 	H2C_88E_PS_TUNING_PARA = 0x21,
 	H2C_88E_PS_TUNING_PARA2 = 0x22,
 	H2C_88E_PS_LPS_PARA = 0x23,
-	H2C_88E_P2P_PS_OFFLOAD = 024,
+	H2C_88E_P2P_PS_OFFLOAD = 0x24,
 
 #if (USE_OLD_WOWLAN_DEBUG_FW == 0)
 	H2C_88E_WO_WLAN = 0x80,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
index 27ac4f8b9a9b..e485d6f8b6bc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
@@ -89,7 +89,7 @@ enum rtl8192e_h2c_cmd {
 	H2C_92E_PS_TUNING_PARA = 0x21,
 	H2C_92E_PS_TUNING_PARA2 = 0x22,
 	H2C_92E_PS_LPS_PARA = 0x23,
-	H2C_92E_P2P_PS_OFFLOAD = 024,
+	H2C_92E_P2P_PS_OFFLOAD = 0x24,
 
 #if (USE_OLD_WOWLAN_DEBUG_FW == 0)
 	H2C_92E_WO_WLAN = 0x80,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
index af8d17b9e012..d5e65186fc85 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
@@ -131,7 +131,7 @@ enum rtl8821a_h2c_cmd {
 	H2C_8821AE_PS_TUNING_PARA = 0x21,
 	H2C_8821AE_PS_TUNING_PARA2 = 0x22,
 	H2C_8821AE_PS_LPS_PARA = 0x23,
-	H2C_8821AE_P2P_PS_OFFLOAD = 024,
+	H2C_8821AE_P2P_PS_OFFLOAD = 0x24,
 
 	H2C_8821AE_WO_WLAN = 0x80,
 	H2C_8821AE_REMOTE_WAKE_CTRL = 0x81,
-- 
2.56.1.708.g77570a6a1d-goog

