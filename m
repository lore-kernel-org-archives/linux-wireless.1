Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063697;
	b=CdxXoNH86oQcYWKdBp3KJ6b6/drNESsH58b1Bn09X6RmmGnyXn40RGA4/Iqd0P66z4QV
	 1fYVcpbKg8Da1+51It42GbbvLyOoS8ysH8o6X5uDh/2Ss3XU4gwAfd+4e+eZMUsWpcoNf
	 3BeIzuTYJ5IgaAZA4rRFvobMQYQe6BNvK1M5IFgY5w3TdY5qEF3PCWB2xew5LRNy3bDqC
	 l/GDY7dxFFuJHcW+beXOvCzAiNeHUDZM/uZiZ6tQkRx9S5WjyCOPR73EJ77niUK5+o3Wl
	 iju2u/i2HZWQKIOEZDeNyNrExA2CWWBbIrpF66xll6GWQaiFLYle/j09vdlWh+u+V3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
	b=AaUA7Dbd5W7JxnP+9iB29IdchPg1tHirVKPm0nhh7uwp/XKS/w1uXf/uCbvlzyYSLLJt
	 ae3QY3NEzpnh/R5uzsHTqPeASW/5vL5VtG4w7sz7PKv8ujXftFD6Kehom37GhSHCj26IV
	 SZoLqjo1qkqZWoGV+d4C/A9vpjq5+yH4ZifLQFvBwLM3nBO8rqEhRzBy0ScPQhk+wofML
	 JJpschVKIxlQBuxgyS4yBxUnWR0vVzo/06JrOt/2m2bLBox9gZ/E7nEUBIyERKmoWDcbm
	 cXQxrbVHDB5nXqFkJczbw6KVQBdC4ENCouYa9XQfIWIQRhmIXcVpaLuIGGnfFpYeS9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnhxDt6n;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE29606B8A4
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 15:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE29606B8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnhxDt6n
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso2720896eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063696; x=1794668496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=NnhxDt6nUg3fxAndo05h5lnjvuR/6rtM5p+/SfcuOgwVxcCrC+wm5zJdVvcfL0/WZT
         B0zR7/sCZtx/JD+hHlOui2QWYb6hX7YDfXCcjpeliTRtaeTHSiKRZ9x9KQF5fdbqEpdv
         b8sL3vpsTStBLPu+Uslv7eqpq0OTDzqs8NVHuH15c74W0vYefAGEC946TSCj3DC7yE0p
         uB5j85ikVNScUBOnUeS1SyeY8Eu7VO8I1pFXb76n3Fnj4+J78X8OR3cI1J2Lv4YRizrG
         BNEle0obr2VpgpKwOW9LTOTsJ/+APx4eElvu5dwSOXdHVlhuMqvR8WWm5Xf20WzX/a9Z
         3A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063696; x=1794668496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=qB0AqZdaKe31iiV6OHMzxiTZv9w35Dv6RATi8iV2rmZKDTPY3sh3NEWxTpuGD3s3Ea
         LghwTBi/QbMrRytrZW5s74mTH37yK2nLy/kSKXliCdCYLHOabSZTfCXf3aaaGwyJcjxP
         fkHROhjmtCxwR4/U6JkG0MqVJAtNIBsPnaozRW27M/gXNgtozm/JeW3rgm7xyLJPprs5
         gpOlTuTmEMOIQDC7bqgYyE2bDx5sVwVabAew6jMuccAImZQwnds70uecblymp4GXJh8r
         g+eQblmJ9RGyLITq/dX98zt1s+oIpJkYkM9Uqj32WkI78fh+d8AzH84Pu6Ae1PJLhoKR
         mYvg==
X-Forwarded-Encrypted: i=1; AL+hErETXT83AItmo7L82PKgCHoJj8GwICpJ0CuF3YV3d4VG6zDjLDgA6/iTM3SRSIc0CDXyplV/fNquOQbeNKp9TA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S22dHAlo1STXvuYK0DNKxXmg6pCAEv7aXFImjlbBQBI7l4G23
	HglEoRRNHhBWX8q8ev7Wd64JqjRT7FqGBl9CfnFPX/r5M6/5tLgWAFk4
X-Gm-Gg: AYBFou0O4Nx9ezxOXsdW1gy+4m02klZqDOYiTktx8Dzu82ABhALPa+AcxJNIH8i3SsD
	F2FHhqi3Ak1oZZJA4HG0dEm8GG82PljedOTmS2sOLtsyeyn5cSxK3M0RPxLOdaRFyl+zooFO+Zs
	p+LUO+C1UR7FhJUxT0D0j4qtsEzE1viUKCtIPsCm1IoBPJt0CiTF8w8TAMPqirmKVXDmVRpnPBc
	dm5MtnRiqpGrg2DFLtwZX/zVRqR+uRL8JUreL8XGLMR4+1MOqyeq2wbuYJneCj607gStvgFJYFo
	ARVn/rAY1Iy9NBD7mZklAMvZTmL5j3q0hHdLNznpBwYs9Q5Iva3fmspPsvnTe/ouAVRPtKvqGvN
	IQVr/2NyGWsHzIKaiy/pswY0NBtf190qLpWBz6wU3uixaHsiSfZwHr+KJet04AwlHl5wQi3lrgD
	UcyQBhgD6XxO9oWRGVX6Ingm+vJoCS56KQplKNLeh59ywcrFd2wYabeQqbPhOC2R4I50RVaxMc2
	wZun/tu2kCWC+yZHr8OD0fSkXmd5t8UHCo1wstTlL9GWli1+gNgJlGpHujw3SqI6OQkj/L0Zd1L
	4BihY1tnvMtJcbsaod463Cz0RhRtXMatBLNCiVwmHGLulAcA8ZQ=
X-Received: by 2002:a05:7300:c7c3:b0:36c:bf78:967e with SMTP id 5a478bee46e88-36f75a2b06bmr8006122eec.10.1794063695913;
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm15540799eec.7.2026.11.07.07.01.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Jason Huang <jason.huang2@infineon.com>,
	Shelley Yang <shelley.yang@infineon.com>,
	Avraham Stern <avraham.stern@intel.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kurt.lee@cypress.com,
	Carella Chen <carella.chen@infineon.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Darren Li <hsin-hung.li@cypress.com>,
	Ryohei Hashimoto <laurel.medalist12@gmail.com>
Subject: [PATCH wireless] wifi: brcmfmac: skip beacon fixed fields when parsing SAE PWE rates
Date: Sat,  7 Nov 2026 23:01:11 +0800
Message-ID: <20261107150111.12424-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcmf_parse_configure_sae_pwe() passes settings->beacon.head directly to
brcmf_parse_tlvs() when searching for WLAN_EID_SUPP_RATES, so the 802.11
management header and fixed beacon fields are parsed as elements and
Supported Rates is missed. When BSS_MEMBERSHIP_SELECTOR_SAE_H2E is in
Supported Rates rather than Extended Supported Rates, an H2E-only AP is
configured to accept Hunting-and-Pecking as well.

Skip DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN first, as the SSID
lookup in brcmf_cfg80211_start_ap() already does.

AI assistance was used.

Fixes: f3d9c56e6eb2 ("wifi: brcmfmac: Set extsae_pwe parameter to Infineon firmware in SAP mode")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Compile-tested only; no new W=1 GCC/Clang, sparse or smatch warnings.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871260..0c91fdc406bd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5144,6 +5144,7 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	u8 ie_len, i;
 	u32 wpa_auth = 0;
 	u32 sae_pwe = 0; /* 0 = Hunting-and-Pecking only, 1 = H2E only, 2 = both */
+	u32 ie_offset = DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN;
 	s32 err = 0;
 
 	if (!brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
@@ -5167,8 +5168,8 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	 */
 
 	if (sae_pwe == 2) {
-		supp_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.head,
-						settings->beacon.head_len,
+		supp_rate_ie = brcmf_parse_tlvs(settings->beacon.head + ie_offset,
+						settings->beacon.head_len - ie_offset,
 						WLAN_EID_SUPP_RATES);
 		ext_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
 					       settings->beacon.tail_len,

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

