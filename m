Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759986;
	b=hXR+SLShk6QpfgMSjs4S0KJgCSQn2yaiF05eVmawB0W7BMv9Co9BG1nAiSdvdaj91PWp
	 Stw7I90JAawhvySHL5hdli6fyUpikoaYA/H9I8T+h6JbClLxAZyb8lOseCKmHyChDaAdk
	 rDGuxkH5L/CfWpf6VE2wX8a5E3i86lzlegTPfPkkW1YThZGxXdfbbep75/FH6Gef+YNxh
	 tKU2tMGbJyJFYstb6aVuGGJJwmy/Oji3fdkGp/NLfuYSdOqgzoLb1utBo+FDL2LuUgxuR
	 fh9ts0Pnh9+hzAZRWerkv/S7dy9YXY1lmsdiNhViLe+ooAP7uXunb9Cx79OZsO0QMvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
	b=SOoiZEFeLL1zgNMBdxqWr1nf4uD9Uzh7OgFB0X7W72QyT+WhhH8yOf4ZPREzubSUx7lY
	 92OjWK7KAhJNZdOh9IJzlyk7kApCfxuaUFKYnRu00+HQHG/ze1sOVsJEeZPufvn2hl5kf
	 73zx1ZEq+BZXqUUcnmvIDwNqZG2yV0Kq/Uu32jMjnFaOQHZmiP9qud08QkrmBF6PAnTwv
	 Ex0r+CBDNc02++bRPCOmIi+uNArAVe3ULCsAIuOxMcmGzEEd3vSXfJTtetlGLOZbSa1/4
	 fqlHQ3TvuSG2DYnE3RkCztWY0bs5EZFV13bsLM8fb6hd163olabe7qG8qiHKgmWYpJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwYpj1yN;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E2606A32C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwYpj1yN
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso6828287eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759985; x=1796364785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=VwYpj1yNNcxsJvWPKOsFJhMIArOE21iHVxBb/peU4uK0KJ+3YU/Mcb+iYUmJ4sMXw4
         Lz7me6cMlJvnDG0s2KC4n9BpV8x/qRAwGZ/M3Sukj4vXTqUMC6Ntb4qSSS+IJsJjc6U1
         SxVseqW6uXRJ8VpkhEkvKWsAyQFIVWirDjvbbjDjW16lj4jViEVF1ffOHIuie6hZ3EeP
         jGSk6FjpF4azPRRvqlrU/AZMDg8kU59JcxmhtLBxH2KMU1hH+poj2eDgDR+ktxd0C5Uc
         GqFfox0rSgXyeuZ76p68I/UOC00CODbDjnUCbj2Ai+Nwdt3O1UMecwBWuSmQqcjbwf6k
         9IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759985; x=1796364785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=TSshB9ThNmTs0vLtym5sAyXVHv+34IoUNk+da6qudGkdmKXxat/Wsodk9siA6pIeaY
         tLc01r/0s/cUZJ5LZ1lqgVCUnfE6MJa0M3+v0wu7q+U2Sty6MZTds8vlS84Hxd1KKCuB
         /pOMFDjrQmt7WKlx9/jbSp5xFJNAs5ix2y7nimsSXRyZvAU2QFFCmXXOpB6jgKaAsQX7
         2XrIwymDpaJwTqT4Pnjj94ZjnLImUJgV7eJZiHnLxwGCBmTqdRJ2QHfMCYVNrznxJ18G
         Zg/SYozPTu8i3LTDv5xzS62tj+IgVVU0rrOsUCMZkM75O3G7uVYfQrxa2lSQ8/r9gaZs
         YZ5Q==
X-Gm-Message-State: APuU4Z/WSAlaDuOgy+wU4bkbz6TUJb4FqYeqgPMdru1XmoI3clXOWn+A
	MQa8O0qZUu+vLESGGL1vNFgM2lOJktpb5t6jwd7tQmJy3PBVlUJAR4LWE5ROpp52U/Y=
X-Gm-Gg: AZFdTZe2/2O6qaTE4++BT5DctaLnP1Xte5F2VN/b88Jpqeug4we9wu7Nkzk3wDrgD5I
	krRuwPYNZ3Mf8XCEdFCwGseRUA4g+zRUOCtWnQS6aSYTGwr1o3Te523k/0nYDCfKS4w0aJ9wqpg
	B2Xz0ssUKwJW6teeEGY+jGKz5cS+zUdTsKvilduLCi+JZLV8VgRRMUTRzQv1x3n2WoCIqo2ghLo
	2WgR568kI+uFxqHw0Tq4yNE+inkxtZ991KaxIerTIve6ly1mVFHiFcw2IQLD9j0ZA19q72RZYdu
	mCwOleNpwvUitndq465SEM66rBWYZwBy8lEHXi+IL5/uot+PgeO4gyP9P2Mt8cKkC+D7MyyYG+S
	TGAOquqZsvVFIb44ADjvw0BYPI+Hdm49zEw4EhicnREoBBS9n+wi+jIunF0yWkcFRGfsk/5h0rO
	8aOx5sqkrZtE7T/h5v8TKD1Mpz7OjcJJ07EJzVjUgVlQ/44U14OJ6i3PpBzNm2DD0ZhEkJy9Buh
	UNS7gpyrdKBLItVjjv8qNvuoUsMQCJZzkPW9O8AHKiDYJPn12i1C/Qy6jhARM92Cq2pqElLn2np
	rSYoHipGYmMOVtbZ4tChMe3z+ko4FSDc97UOPr2pB745ugB6065BWc2CqbfYkK/5n+O+ow==
X-Received: by 2002:a05:7300:ce81:b0:384:a3c5:35b8 with SMTP id 5a478bee46e88-384b3986ee5mr27744207eec.8.1795759985522;
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 03/11] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Fri, 27 Nov 2026 14:11:33 +0800
Message-ID: <20261127061147.506129-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7e..d519e950ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f519..c5aaaec434 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc0052..ac577c8e85 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e2..7c1d43323a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

