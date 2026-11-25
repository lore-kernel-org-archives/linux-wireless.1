Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610855;
	b=hWxDq77+OKUNch1h3mC91jcx5s+GGl7eQu1j8H5c2hdI0mFPHl+N5suDWRlZOJD7/ChP
	 JDQ2axTZXx5Q84UddUGEDdFSFobvtd94j7ZbIgBYZCyHRuYe61D/f0P8aOJO7vaksEnc3
	 /WqgwV4o6oDuftsmjyL+qQ1IlhcemClym4RMw6tRwinUYZNCsv2WwKW20PPOx6qtHj5xq
	 lyu0ByxJQs2eaOS26ymk8lD2T642vZDvoMNZVf7AXbr4gpycImUkHFHD58hl5XS+Owsuw
	 rEQ4YRO4D8PvB6thN8jeR5ZQiHn2HALEc/+rhnwVbLhhSw5Ivurt1xQFE8/ws8dyQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aCfI6a/zP/OYsLubSdHwypOfvr7sIecMTliDmL7DD8s=;
	b=SiGGbTgjEaL1U0QWohcYVvyLE8Pkc9iXEzAFSfI22nC69nTDD72U8qj995CH8CxuBJE8
	 FvhwQiJwXcm5z1zKygn1h2gcejI6xWhQxOYi6GQK32VJ/O1is7Z6gQI25obyJNOeq3dQ2
	 pb0qURdw81+MsULxfyAtZ5MmNANv0Otgc2AMLiYgDm36PE5J7T7vC9MTW7EqGWGHoa7Ox
	 7/ETX5v3Q7xpj5rDTVdh4mFGA7rdQX3US04eNfR8sIc5/J3PYBuIBC01t0Iy3firDIBDv
	 KtsHMalEy+kSYNm/alkjlNwHCe/eQ6BKSe65cq5uV+UeyJd4KQ9kmJzNFoJpwap4/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7RyHtQd;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6E606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 12:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7RyHtQd
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a358881793so2973136f8f.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610853; x=1796215653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCfI6a/zP/OYsLubSdHwypOfvr7sIecMTliDmL7DD8s=;
        b=T7RyHtQdcuHwWkK8KMfOvognN28g69x7l6/5+6/0KGn9rY1xjBE6XnS9BOAAXgsrTk
         JPlDXIWW2hiP1/qPPNhuNR1LGePjcUN1Qfh2MAKu7FpMVP6LhQUodfI4hSp1x54CqEsx
         3hiESnomjqfPV3rMMUJMtD55Fo+dCRK4BNKpuOy4dzloMVRhK7dVlodOgaIk6ITglIjo
         DTv0U8bnM7+nrHyXjg0Es5hCHMCBNTZDIp0cxDBKjlLQydz1xa/92ztNucqp2U17WZdK
         vrHcD1LZJ/1qCSZ2Qx8YQMGzVk2yYspuYN6Hdvtowuyst6yvFuAQRY52qJgUWm1Jplxm
         lk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610853; x=1796215653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCfI6a/zP/OYsLubSdHwypOfvr7sIecMTliDmL7DD8s=;
        b=cHLBUQCinTbYos2SY43eEKFOTYR5JUOMqKksjs+9AyasJZSXs2Ok6vB9wEVRi5xBYO
         SFCUQgDset6aJMEzizKzCOyknqAsdlF/UWRUKsiLKRBshnsBKuUEJLCrxLhZTJ7nm4WR
         3CgME3GYzqGZVTZOH0G7RmtujTKnHSn1SyVAdztLJUCE2xHViD3C+X57UKXXJ2+7sDcl
         985mvPuxiK20uBUpDkbOFrl2n3b5ymX/7Oz3eTmVDz2yRj1hWRTqjE/1XhfjS4NaQwKx
         fTe4pgFY6WlWIwVyI6GUwBeSulndcUTnvGas70uRhK4YKLERzXpM5O2p3DEf9Ihu1q5q
         ByWA==
X-Gm-Message-State: APuU4Z91sOLIfARHZS/fRRNNdcWZ/t9R/7S2DnHIEqoAfv2wdwGo89lu
	RAACeXXoFmptHHM2SrAF5YN48H+BLo+xKE0Drk0Vd0gdNs7CK2vWDewFx/mVevA0
X-Gm-Gg: AZFdTZeIYV6/lCvRx/7vF7PAyQwd+nbY2UnARuBoiEDV8PQNuOxNFiF1N2GJOcTCNna
	ExIxiKfj0t9SdjNdOZkPp1QGGpz6HPqV5lEV1ELyBJv4A61H2Uyx7RiNWmirR2k/oKHHqqXdag5
	rsnfWpYww+B39PN/eUm7VhORSlaN3CXyFeeC8JMe3rDndIZTDNU80Yqg3sBQa4MC/HwEpHM2uAM
	QgvvGQWjQgqy9o7A33L19IuMVsKc8uFGrM1GPh1MyXnw2U/5naMF3PtrK1weu15fGpzLsYEnGW9
	tJAA3KtriLC8eUSxW2Y9U9RWMMJqK1XEvcni+1vexxnVKpza/5SCfScWBU2/RJh8GgvfJIeuuTC
	86Q0PBt7SS1Wcg4EECM/MuVESYEr0ve33cLejQG5BAKHPMQNlnqhdHmvEAS4Dm5o456glnL8Yh9
	V+xFOr/o4LskkeGuqgJlmceyyAh5DGtcrC9afmE3wfcmW3/5+WBYJkaLugSCu4RGxY31MGez2xw
	mnSdtLqWOv4a2OlXqm4LY+qAiNRJA78Uc2r116bFknNU5eIZ9MEgj1Y3mUV3xq2ee084t/kJplp
	nGTFxwFCpHcnl8/0l8yRW7cSy2QqeuiIxXBYHTp/T+R9iEq5RAiYDGTBRQaG+kl5W+/Vp63aTqg
	UtVPWmEnjplZFitoHzthe2kPADcoNwAbXvd8eaqHv2i4Sxr5J3uIYk0JIdoEOXsIoQ2nFQ5pdqY
	TqCLODMaZAW9d7xR8+q45Ds5/FafcrU+Zd0c+RadWr8fQkYWpn1IGl+omGXVnqYi5EIQK4uCogg
	Ss=
X-Received: by 2002:a05:6000:4812:b0:4a7:b8ab:df86 with SMTP id ffacd0b85a97d-4abb5db73bcmr32120653f8f.38.1795610853036;
        Wed, 25 Nov 2026 04:47:33 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-7575-e1e3-dbaf-96fb.ipv6.o2.cz. [2a00:1028:8388:a84e:7575:e1e3:dbaf:96fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm34013000f8f.20.2026.11.25.04.47.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 04:47:32 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Dylan Eskew <dylan.eskew@candelatech.com>
Subject: [PATCH iw] iw: scan: fix crash and over-reads when printing EHT capabilities
Date: Wed, 25 Nov 2026 13:47:31 +0100
Message-ID: <20261125124731.97143-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

print_eht_capability() takes the HE PHY capabilities from the HE
Capabilities element of the same scan result. Without one, he_cap is
NULL and iw crashes. The MCS fields are read straight from the element,
so a short EHT element is read past its end.

Copy the fields into zeroed buffers, as print_eht_info() does, and
treat missing HE capabilities as zero.

init_context() also reads the extension ID of an empty extension
element and keeps an HE element of any length. Skip empty extension
elements and keep only an HE element long enough to be printed.

Fixes: a6ad3f11ead1 ("iw: scan: add eht capability parsing")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
Checked with an AddressSanitizer build that feeds print_ies() crafted
elements in exactly sized buffers. On master, an EHT element without an
HE element crashes, and a short EHT element, a one-byte HE element and
an empty extension element at the end are read past their end. With
the patch they are clean, and the output for valid elements (80, 160
and 320 MHz from an AP, 20 MHz-only STA, 30 bytes) does not change.

Without an HE element the MCS maps are now printed as if HE reported
no wider channels. I can skip them instead if you prefer.

It does not depend on my earlier patch "iw: util: fix the EHT PHY
capabilities buffer size", both apply in either order.

 scan.c |  5 ++++-
 util.c | 24 +++++++++++++-----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/scan.c b/scan.c
index 871f72f..8208dcc 100644
--- a/scan.c
+++ b/scan.c
@@ -2524,9 +2524,12 @@ static void init_context(struct ie_context *ctx,
 			ctx->is_vht_cap = true;
 			break;
 		case EID_EXTENSION:
+			if (pos[1] < 1)
+				break;
 			switch (pos[2]) {
 			case EID_EXT_HE_CAPABILITY:
-				ctx->he_cap = pos + 3;
+				if (pos[1] - 1 >= ext_printers[EID_EXT_HE_CAPABILITY].minlen)
+					ctx->he_cap = pos + 3;
 				break;
 			}
 			break;
diff --git a/util.c b/util.c
index 1bad4ea..4a1cfcf 100644
--- a/util.c
+++ b/util.c
@@ -1982,23 +1982,25 @@ void print_uhr_info(struct nlattr *nl_iftype)
 void print_eht_capability(const uint8_t *ie, int len, const uint8_t *he_cap,
 			  bool from_ap)
 {
-	const void *mac_cap, *phy_cap, *mcs_set, *he_phy_cap;
+	__u8 mac_cap[2] = { 0 };
+	__u32 phy_cap[3] = { 0 };
+	__u8 mcs_set[19] = { 0 };	/* up to 30 bytes minus the 11 fixed ones */
+	__u16 he_phy_cap[6] = { 0 };
 	int mcs_len;
-	int i = 0;
 
-	mac_cap = &ie[i];
-	i += 2;
+	memcpy(mac_cap, ie, sizeof(mac_cap));
+	memcpy(phy_cap, &ie[2], 9);
 
-	phy_cap = &ie[i];
-	i += 9;
-
-	mcs_set = &ie[i];
-	mcs_len = len - i;
+	mcs_len = len - 11;
+	if (mcs_len > (int)sizeof(mcs_set))
+		mcs_len = sizeof(mcs_set);
+	memcpy(mcs_set, &ie[11], mcs_len);
 
-	he_phy_cap = &he_cap[6];
+	if (he_cap)
+		memcpy(&((__u8 *)he_phy_cap)[1], &he_cap[6], 11);
 
 	__print_eht_capa(NL80211_BAND_6GHZ, mac_cap, phy_cap, mcs_set, mcs_len,
-			 NULL, 0, he_phy_cap - 1, from_ap, false);
+			 NULL, 0, he_phy_cap, from_ap, false);
 }
 
 void print_he_capability(const uint8_t *ie, int len)
-- 
2.54.0 (Apple Git-157)

