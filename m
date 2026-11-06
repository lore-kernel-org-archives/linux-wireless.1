Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999738;
	b=U5P08RTttVlp9s9zqoY/HeQ3cL9CXw3dUTgeW9a9mj7TvG3pLd+KW2J2HVb3pjYtdqpd
	 3kzLUOjmmDi+R5Gr9GPL9KEmEnB1cJKyBkLwyUT3aNwc4whQ/7xBfq0Vhh5y/ZQWTdXk4
	 5H6ooXAU5QSQ63jOKkNpNK8DdIz65VNsrX8himEDWJV7w7EcfhoRSUl0frzkdkVcxjfjd
	 NRkabMQ30ujJrnSOd5k2+YJiFJGf9WMj+SCgClVPZ73hzrjoZI4wlrli3jfnMtgHNzoNf
	 5QXsRPFCWtdDM81M6dxAnrZ+BfIHIqWJONE4wrCrUKAuVdlFK9mNUKqdezLXXCy+yhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5LdkwID3WreVQx3B/bipks5YOf8mwojL59qXQchJ17I=;
	b=X8eZIhmrD4RHMIoOq02lM/vHydewPJ3YIkqFPnpAFSNYN4PlrhMaE6H8oTdJmab+TlDI
	 +LPa3B9r55nuarBOFtW9Hwjighe1N8U25gWBz3ZTbNq5OT9YKEDJL3sBMHuEzjoxwVjEL
	 6AaA2yTZHtW0Q9tRwvk/wfo+gqO79nleAJtn5hnrtHZx4Npcc4W+tbdTuHZKixGKP2F71
	 AdZ8Ve+fqxU/VLhdXB5yVw4IlqPAmGgDVz/WbPzv8uBO/lx+pPEdg8U1171xpJF6SuBIN
	 LmZ8O0/oHah9InbodsOeNsCc2ftZQDRRPEATsWVBL2B4k/FrLVlaZSr9h1WA6N8aM/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvoNljft;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30217606A333
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30217606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvoNljft
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9993585e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999736; x=1794604536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LdkwID3WreVQx3B/bipks5YOf8mwojL59qXQchJ17I=;
        b=rvoNljftQ+Ya91Z8L6Q3OE0ubAeFbGP7Y+GKm2R3r/cijsbKIbbAM7tYRrrSy9Sa08
         z4ubq3zgMR7WG/vxmQWf70dtGUJ901kXOyyGqAVIUbRd9iErY6T7DMMZ0PLCxL3mWcFj
         MnMrbKs9uNlLImErNghS4Vfyj6km8op/N+D0UahUeIkdcrPC5dA4H4mGK9trURDpEQvy
         CIzO4GzxSsAsJ6E95v3YHeim7bp08QWHe7R6BCdBOaGfX/XTg2XA1VbRxreoF+pbOobs
         8nXmpfKq3rh945v5v1mE8VqN8Q6i/EYE6rAxe9cglkWn2xfLwnk0pOVaWy/WvFa4kbKu
         FCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999736; x=1794604536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LdkwID3WreVQx3B/bipks5YOf8mwojL59qXQchJ17I=;
        b=qYLacnACFxHSCjMBnXxALb8K3aV4t6HiVNOU6GtQTruowjzHLX0209alIekD7gy793
         2yb3wNRw1A8VKJLYVmtSM2EW9gUk8Im6E81FP4PTvacz5QxXM+kXPDpEMhEM0nxQQiiy
         +Z7/fdRiA3qF7+Tnua/y/QM2RxUDADhbT78N9KnGMgs0VIJ3m5dHEfhEcIFyM3BM1Wjl
         fcatk0GtdqbRsioAC2HG3J/7Yv4DUk5Y1cAOW5sOzkTMbESLgonlIj53fzFbrW44VWAG
         W2MQLOkwR+9LWlIqOLwVDNigxS3jsoQpc2L3BeK5Iwj3ZkJLsotbqK1tmxzYAH0GrbQY
         9/Ew==
X-Gm-Message-State: APuU4Z+KkVh08iPP6Sfsq6TEm+MhPwbPw60U1BytKwMoOIFhCHOOneD7
	627bMRH/3qhVTzSSqwh/7gAsJvGfcoAVF/ZHFpzTgVVJ6QvJq7l+oDSG39FyCu4q
X-Gm-Gg: AYBFou2c0zAXpTGl0d7GEFfPGyXV5w59gubkUP0bba9gJIyLtHdq7jnPenNb/GEQVPa
	ZvbP18LzR0uRKc1aq08s6Eyu/rUxEfl+AxhKZ3cAsdCtdd8E/0f2EkdhVRjbr5dQ9my+e+d2m06
	P77cDg6L3RW90YErwAjogm1z73pCJg4H+MgBekUN4bCNXi5xwj/8PF4kUiVYDYyJX4odVxyRyVQ
	iOGQ+kVIAnXDITGmkC5WufEOxNhiRnhXaaWRXkfrlOyLMMkXydTsPfczYvKrCDWQgH6XU/3G+7z
	iSkV1xH+rpUMYy8YzSjtkcO+m/8WzKY6afCoDMrUHmjQXemSliKxf6FF9hGQV2IDTvPx7PvLEE3
	u/JRvh8udfuiA5oPL6h9fr2OW18ti6M+9zjyI4FKClG+Bn88NdFOry2ZhmEhG+Gh5PAV4yyAsxo
	90xsyWGRiT4e3eMsJxSyuQOlIlzBbEggzcVOCj+W8aQxU+FTk0G1RvIUQjM51o499gquma8XRly
	UPFwn/jbCToK8hZb+q49dK10ncpihhktkoItmGyku3Stec4JtpMu0n2V6dfHmhGOITOI2EAKHiM
	j7+Q1UXXghHadHjdGJREzC7AqVHwAh9GKUXo8l0sFVXGJmAPvPY=
X-Received: by 2002:a05:600c:310f:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4b6de78917cmr60814345e9.9.1793999736520;
        Fri, 06 Nov 2026 13:15:36 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:36 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 3/5] b43: N-PHY: fix rev3+ RSSI calibration
Date: Fri,  6 Nov 2026 22:15:14 +0100
Message-ID: <20261106211516.273791-4-luk00casati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
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

Three bugs in b43_nphy_rev3_rssi_cal():

- On rev7+ the selected VCM was written using the loop counter (8 after
  the search loop) instead of vcm_final; the 3-bit field turned that
  into VCM 0 on every rev7+ PHY.
- The distance used I*I + Q*I instead of I*I + Q*Q (brcmsmac
  wlc_phy_rssi_cal_nphy_rev3()).
- Negative W1/W2 offsets were rounded as -(abs(x + 4) / 8) instead of
  -((abs(x) + 4) / 8).

mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch3-rssi-vcm.txt

Found and fixed with the help of an AI coding assistant (Claude Opus 5.5),
by comparing mmiotraces of b43 and wl on the same card.

Signed-off-by: Luca Casati <luk00casati@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 6b0140f05..36c07d891 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -2167,7 +2167,7 @@ static void b43_nphy_rev3_rssi_cal(struct b43_wldev *dev)
 				continue;
 			for (vcm = 0; vcm < 8; vcm++) {
 				currd = results[vcm][i] * results[vcm][i] +
-					results[vcm][i + 1] * results[vcm][i];
+					results[vcm][i + 1] * results[vcm][i + 1];
 				if (currd < mind) {
 					mind = currd;
 					minvcm = vcm;
@@ -2184,7 +2184,7 @@ static void b43_nphy_rev3_rssi_cal(struct b43_wldev *dev)
 			b43_radio_maskset(dev,
 					  core ? R2057_NB_MASTER_CORE1 :
 						 R2057_NB_MASTER_CORE0,
-					  ~R2057_VCM_MASK, vcm);
+					  ~R2057_VCM_MASK, vcm_final);
 		else
 			b43_radio_maskset(dev, r | B2056_RX_RSSI_MISC,
 					  0xE3, vcm_final << 2);
@@ -2219,7 +2219,7 @@ static void b43_nphy_rev3_rssi_cal(struct b43_wldev *dev)
 				if (j / 2 == core) {
 					offset[j] = 232 - poll_results[j];
 					if (offset[j] < 0)
-						offset[j] = -(abs(offset[j] + 4) / 8);
+						offset[j] = -((abs(offset[j]) + 4) / 8);
 					else
 						offset[j] = (offset[j] + 4) / 8;
 					b43_nphy_scale_offset_rssi(dev, 0,
-- 
2.43.0

