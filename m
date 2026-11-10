Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336257;
	b=pL3OeWzdVprfKBjgPf6LASuKSsW1TXjr0YVbEZRhgcXzpf32N4ZBLHr+ea4JYXZAquOn
	 k36FmZjQlSPEyLXemogW4XZ7k1kY6CSDEVuu1oFTVUIx+EjEVVaYlllCgPYELwpFvexIm
	 88piGMKe2gFjX3GRGi7wQvz3pqN9YddoUvCzxBsu9d3zNeGIA6KEvIAaobpFGCsqCfVkN
	 aRFH9DuL4iQ6O0hAB/pYfYoJi8C2/PKFbI2yt+Y4aqzTv+TimgHKHOJJkX1NwrJCQSK5L
	 iakdRYmINdF1lB7T+xPwPA6FalhxTGQEERh/fmy1uj+u40vqb9I9yoZeJt/Ff0PG21w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
	b=M+ILl2Nn+MCL67p8EzPHrWwgBO04xkpoXHIrpCueCjtmRB3zGv25FnTT2SoHhKWEbF85
	 eR1gD13uUcDi58h2wqyk9iYS8gRTL5E6rDnzibLjzTFADMhTsqAtoYmGTwUrtppDL+dZe
	 Px3QmfkPGVmiOIWbAk5l9f2QzVf5hXjS4odGmINVKv+deNxeEXvlhQ5+eKhEQmXY0o8wY
	 mQwrIZbLUv7A8ML8to7oTeGTHx5TEjRMPpn0cXHDvXoFwxva/ExRQ07yPRh8ZTTPFG4qs
	 xUytiNxWm3srtG28qHoidbdltGi9elu02TdLk54NLJ4r4NbLyrVy0oThBRTqc6NSP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fanXBjdd;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA2606B5A8
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BA2606B5A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fanXBjdd
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702fd86d674so1152958eaf.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336256; x=1794941056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
        b=fanXBjddPNz1sRdILWcKLbXrA6LgQADpL5xMD0cLRIQcX0dr7zVN7jr+N9V3HHEwsi
         S946WB7VzXT2tvdLuMPa46vLyTl+9Ynq+tJv8A5SuFtxte5v6WuJSfucSdPaOfT2Qf3U
         4My8ovkVa3HFCidhbLcfgk54eZQFvpIVsSsvJQwdaV5EShj2fPr9LO3a2wypO52tao/j
         ULfikoIrGV2fzOrNb997aJy3VG4yeoEFLqXQSR7j9GlepvvAlR3+ASnfpF9jb0/2bPSr
         RIJ/8UKaEWg7VxfkZupw8k1rkIuAkCR/ritKdv5z31YdR2a75J4bPfKn377tjv37bzWD
         9VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336256; x=1794941056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2wu38ysdtrd97F6AMOyDK4UQjaEdHbNL2Dl/OkwiJ4=;
        b=e/El0UXHw6XXMdQXNiSyyWdJtxnMsQZ3hIRvdXk8humTBdNT9YMNot+GnM6jC0hHPn
         LxNXiuzYo2+4MCpqHVTA1yY/cszBroI6DpoMkH0Yld7cwh8MLFqpEX+hn9DtxR7ZUuTd
         t/ZBY8YTJEUOzDNaQBI3rZtmAs7QiP9d7UHqu32l4QsPcqjUFL8Mix52LaT2m9iqplHJ
         ZfxeomVsiKCHmND6n/nd3fekEHuvCSPbZQi8ZB8pawbqSrYZdc5ar0ZVehi1bBKvpQMc
         MdIAQFIPEi7gucN96grgydhjAQzAZXHEjkZuUlA5ArYoIlZfHmijMpqrTw8wkMURkYgo
         xutQ==
X-Gm-Message-State: APuU4Z9Nkli7wWIKdTvHNGSd0NUp+v3EWfYlDXrabKN9t+jgbTVxfkA4
	79cXbJLK8O92rlpWyEzkcXBuKBYc1scxqBTyWvPmWWRz0u/K66gpIUqk
X-Gm-Gg: AYBFou0NHgon/epGELAu5BjudXgRvMtJa5XCj9d7y1XVlcqn4d+tFXODH/o07vPU8i7
	nFgqeA1eG4dkaJwr0FZsjEN0Fl7HLSn/7mM0XZnK9r6G8ir5AxMxG3QrRYN2qBaunq1TazK/5Tk
	Rl+AJkrT+0PKySSArcIjbql8c9lBDXX2D9+78gCCIisdIyP9QCI4G4lVb3AtP4N16QMfE5lrN62
	lt3yDQmG2CP9fIwik6ELvVMM/wt2jycLzQLj9DL+UpJCZYO23a/CMgqLeVYrVrJaBROnWHBs40u
	7ovzW+vYNtHGoUewnm3wR2xCu610KwpX8sSVfaQZVYMPWy21t4YbflYmn7Sz9Ef01cTTh3QPV3v
	a5FISViJ/xrSSd7dTxioTMbfVhJ4w6Ik3VpLbvoUvP7dGHkpdV8oaI/rnRJg9u48TXrHK2y9aug
	llbkXzKe8K4upHNJKOggVY2vCiJV8wmQMN+BdQQVwxct4+6jI0Kyo7fSDFhVIOA+pvvPZTqU81S
	O5+QJxfrDxOsyygVlnz5Rpq/Zt3k14oO9vdx9HFaCb3by0VXEVAg+UDnB/+rMi1Hx6C35XeItJT
	rdyANhBhJKKFY7F0SxKpKI2UBiGgiWHrdQ==
X-Received: by 2002:a05:6820:508b:b0:6c3:19de:d1ef with SMTP id 006d021491bc7-718a5a583a8mr1411991eaf.20.1794336255585;
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 4/6] wifi: rtlwifi: rtl8192se: use ALIGN() for the H2C command length
Date: Tue, 10 Nov 2026 12:44:07 -0600
Message-ID: <20261110184409.42205-5-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_rtl92s_fill_h2c_cmd() and _rtl92s_get_h2c_cmdlen() round each command
length up to a multiple of 8 with N_BYTE_ALIGMENT() from wifi.h. The
macro spells out the rounding by hand and special cases an alignment
of 1. ALIGN() from <linux/align.h> gives the same result for a power
of two.

Use ALIGN() at both sites and remove the macro together with the
comment block around it, which no longer has anything in it.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c |  4 ++--
 drivers/net/wireless/realtek/rtlwifi/wifi.h         | 13 -------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
index 579b1789d6d1..0719d0bb2cac 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
@@ -431,7 +431,7 @@ static u32 _rtl92s_fill_h2c_cmd(struct sk_buff *skb, u32 h2cbufferlen,
 
 	do {
 		/* 8 - Byte alignment */
-		len = H2C_TX_CMD_HDR_LEN + N_BYTE_ALIGMENT(pcmd_len[i], 8);
+		len = H2C_TX_CMD_HDR_LEN + ALIGN(pcmd_len[i], 8);
 
 		/* Buffer length is not enough */
 		if (h2cbufferlen < totallen + len + tx_desclen)
@@ -484,7 +484,7 @@ static u32 _rtl92s_get_h2c_cmdlen(u32 h2cbufferlen, u32 cmd_num, u32 *pcmd_len)
 
 	do {
 		/* 8 - Byte alignment */
-		len = H2C_TX_CMD_HDR_LEN + N_BYTE_ALIGMENT(pcmd_len[i], 8);
+		len = H2C_TX_CMD_HDR_LEN + ALIGN(pcmd_len[i], 8);
 
 		/* Buffer length is not enough */
 		if (h2cbufferlen < totallen + len + tx_desclen)
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 21a294b80c5b..24c6db867421 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2806,19 +2806,6 @@ enum bt_radio_shared {
 	BT_RADIO_INDIVIDUAL = 1,
 };
 
-/****************************************
- *	mem access macro define start
- *	Call endian free function when
- *	1. Read/write packet content.
- *	2. Before write integer to IO.
- *	3. After read integer from IO.
- ****************************************/
-
-#define	N_BYTE_ALIGMENT(__value, __aligment) ((__aligment == 1) ? \
-	(__value) : (((__value + __aligment - 1) / __aligment) * __aligment))
-
-/* mem access macro define end */
-
 #define byte(x, n) ((x >> (8 * n)) & 0xff)
 
 #define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
-- 
2.43.0

