Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821010;
	b=m7b+x903Gfp9J9PcAi749IokJDlldr/pAHguqmAvtYa4o9ZHlv/o1ofvDAZKg3D99aEY
	 +nth2OUXZ6Bz9LGgXsLKllTihOzFyryZvn/q8LoHcn4UqvFKtlwfO4EjxPUwWXuKDdB2T
	 Bk42p/apDpCuXDYvnnJv9acO3KSNqomRV3fqQjsZ5cxA78tgFS86RhDnpJTTAADL+n+OD
	 fkxaATFik1hdQUwiD1xXyEmMG8o2W4IGtjy5hRntQJ2wX3XeI8+pretG6j0z9TUleRzcJ
	 XdhsK8qu93D/j7YoCNIOEf6VENHZrnpRe7lxtjtOdUnJcNM7gDyVd1pDg+kXLl2Z7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
	b=ziImlGu3s6s+mVSAMbABosvYJLgCh3CNHnF8i6FL7sU83h4SiITw9F4ayAxaFYSHauPA
	 sNocTD/87Dq5w87pdQUyrtoUGpdBeX9R0PSBjbkbqMh8KCfPpnt9ZT8ChQqg8xbJerq0R
	 rQQEq8snhCpzkVi13oW4JNfViXzSKBYgxqFqDaSw9dtT/igph7TXiDyxzNm0wLqWWyvV8
	 SmvELVCokmGLUM0f60FaszY6e1Bfvbvnfpj51UbePCvYI4BF2IZjQY/BiM1vIewpQOmjq
	 EGokCd69AaA9iHSXYdFyKNgxfpbrawB1wecvhMv5YfiHn2xHCFlLCQ5fLU3WcUZ32BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyJdSiG1;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546D606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0546D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyJdSiG1
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e977109392so17473085ad.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 01:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821008; x=1795425808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
        b=EyJdSiG1l2h+Qw6QXQI4AHp9x+efFXbaWsf23ACOXySlZe0TOjoqVsBCWPBsyBcoR9
         sf+4UbiR5nLb1kqDIoosl/P0PdpUpz1BE1aQRTu5bT7VlCCg4iXwo5j3Pltpl3HkuRo0
         GE8N+v9TgrxUzUfj44iac/geYD0aQ7juG2ugZ0HteyxOdyDfOzSDUa0vgy7a2E8t7Kt8
         P36kmyYTtmKnT7Tw1u6Hx5uAy4TmY/9GuYZ2u3aekdILN1fvCLzrC+AGDRB4GB4aeXmg
         aAd65yQ0dv/mxYlE8E+2Llj+n/z2yp+YtM5rf3OUKnWH+NhmDZOkqGcYAY01Z+kC96ku
         9mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821008; x=1795425808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Di33WShdwbsd6k1hBxIRZVPI/wZsEbgX0u8y5qE320=;
        b=ukgwlu3BH4k1+nt5McnzI39YZRH7zNOsZh/Or98SN+UQQkZXHrter22k1nKPc+hses
         H8EBVpUNxlCSjAzECfE8muuxE+aBsJJ4QAVF5nc2kWRR7c6OUdqEdyn+7rmas8lzeQTU
         GSX2z0RGXKy6dSQlftABA4FXOV+Ukj21OXU7/jJrrYfyZPGCNCDSJsrO1xoyfOjzJJ/F
         Osit9Z18RHtYloTq9kmcQ4B7X1fUB9oacNRaOcc050Q8Ua8lEsnS+MkZTm5WA3+FbyXd
         1ifhvFGDFlw9D+juDtUsVW+GLLisJN78t98KbUapFPgawYHpKj0KbkDLiVaFoBISsJnv
         hk2A==
X-Forwarded-Encrypted: i=1; AL+hErGW4LfVmfBvUCZDZVMlEoNBZmsRKmzkhNJDxGRUgVtrkZPwM9NSDnIEt7HuAzvC+0kKe/xYE0TXLyvB61ddPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82Ji/el6A6Kv+f0c8hdqq2MHa/AOVp24pVpnQJv7R0wa0C5mPX
	n1grrJDAE7Pe24ykkgWrgt8cBlpjDOeB8tuqpjp8M8HDhDMXEoIYkv5M
X-Gm-Gg: AZFdTZfJwYSoTP7WqQGA+k4GvraSgp8QXaX2VYie06PhpSzP9lOQwdY1yI+1piMkmSr
	Kj7O3WXOSAUSMLN/f7SLL+4HEi4Gvy1brWMnr+1XgYADALsJoWsRpmi0zy4o86+nCT5ndLpmQFO
	FcVqvDYu4ZVsLvlH7kGZ5JRkL6mGeEk+qDxANs7r0jJNYFMVdZklRsZgWOO5t/Jxp1FPlE6PcMR
	CIxkaNaW94DYSZKnThiYKcyriFpo03XPKE0msg6GKDOitCIxrYO+7VLbLEbx+/uZJl6XEkO7v4R
	CklXDkpGyc5C5KnFnP+Hb+fDFeCwanglXES+HvH2aIM8IecoxX0KH/24ac5PS059Zvr9gemcInK
	Vy3uFPUCnvd8yJsxSyq5800hw57B8oUCUZEI6rzYepkD6HwGh6Xnb09gmj5Rod3iM1zjcrpWBBE
	HE7x0um33qbvsVyY4BSPLaLgr/Z5VhxHiyQYgSUz+/sV/iDaTB0V3OHeRxWMvP+lQKBIr4Mh5sH
	MhBvS0jRszg5U2WJH8HR/hI42PGBl8CbLmra8b3qwPUUSNalyYBJ8ckneR7XHQH/JimoAzvAMR7
	l9uWEBDx57xTKyJWj8YTWECjASC4CDA2ebw8L0k7UPCDmfQjeitzYw==
X-Received: by 2002:a17:902:e951:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ee0da98ceemr88257225ad.20.1794821007979;
        Mon, 16 Nov 2026 01:23:27 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7d99fasm35015195ad.35.2026.11.16.01.23.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 01:23:27 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Po-Hao Huang <phhuang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2] wifi: rtw89: update PN state only from correctly decrypted frames
Date: Mon, 16 Nov 2026 17:23:00 +0800
Message-ID: <20261116092300.20414-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rtw89_core_skb_pn_valid() records the sequence and packet numbers of
hardware-decrypted QoS data frames so that it can drop frames whose
sequence number goes backwards while the PN advances. It runs before
mac80211 discards frames with an ICV/MIC or FCS error and requires only
hw_dec, so a frame that failed decryption still updates last_sn and
last_pn. Such a frame need not come from the peer. One with an advanced
sequence number and a PN between the recorded PN and the peer's next
one makes the check drop the peer's following valid frames until their
sequence numbers catch up.

Skip frames that rtw89_core_update_rx_status() does not report to
mac80211 as decrypted, or reports with an FCS error.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnormal PN")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Keep the two existing conditions in place and append the three new
  ones (Ping-Ke).

v1: https://lore.kernel.org/r/20261115172754.35124-1-enderaoelyther@gmail.com

 drivers/net/wireless/realtek/rtw89/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 58ee5efc3b5e..ef6bb1a43cd3 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -3950,7 +3950,8 @@ static bool rtw89_core_skb_pn_valid(struct rtw89_dev *rtwdev,
 	if (!ieee80211_is_data_qos(hdr->frame_control))
 		return true;
 
-	if (!desc_info->hw_dec || !desc_info->addr1_match)
+	if (!desc_info->hw_dec || !desc_info->addr1_match ||
+	    desc_info->sw_dec || desc_info->icv_err || desc_info->crc32_err)
 		return true;
 
 	guard(rcu)();

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

