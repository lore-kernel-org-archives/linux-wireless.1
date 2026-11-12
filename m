Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460333;
	b=s60mSl3nJDPEf+MWYw+FuxAmKlVuthI5VwX2Jgru1IB0c1tRTrV6ib4Z7ncOcvjY4bcR
	 WVkle5H4yR0az9lq6n/ILbLD6yIG6YXFQDtFQ3Q5IFdMsRf2pxkgVUIUPyC9vjJHlu0zw
	 S0/AD4Rrmwfj1vHPNlKCWsFI1YkVR/1rZl2JIrhI1jmlq4EtZnkpyj5GVTmPOYeR8quA8
	 g7hrgVW/uvVeISntdfwwgPvtxoztHzkAsaJjeI97ZnZS2Wsa/5ARwN/pCZ8Rd+ggpLj5F
	 /DAwIKwsZhJ7Zy98T7tpLOzKzSU4eN1JvjrDFUL6Mb6GcPbzxms8bG0oG6dbqt4RJ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=P86eC0RmDJzNUhKXerOOwvs2odnEXQwZSS2SwyKRI4xWeuNGG2xbcZlFFn5kAh7DbU2C
	 kQxzH/ucZ5YzVkn817DYOnRnhRjiBu2jVXNT5APiSlTTYF0FdviDekS20fAtWHoHo+9Jc
	 JYnXIVYb/RKD0KNJ/hvHyxb8cnAINMcxIncfEC70hAnNZVNPmSNO3Y1kuOLC8AgkEihdr
	 kG6L3TUO9NO6P0gUvcPz8XHVEM6TrEDNAWqDsJ9cpa/ZPRNJXRPqTa/4ptQDi9DHsefDn
	 LMk0HbCwhOwAG6l/z1ugqCZptD0RSxDUYpcS1X29Fpi4Jtm44KMt3ZSMuRLvNo1gtfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Vg50J9;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA56606A8B7
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA56606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Vg50J9
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-372bdb942dbso4985083eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460333; x=1795065133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=k4Vg50J9fupa9Alz/gxsezfGnSg6c9SL+nU6684Lwc8aZxxY9JCeZ1opzrOd4JIFAy
         xqQ0NzLpMVH14Fw3AUHd2UHIePbkznIZ0QKi22ajM8erBoPUFzwZG1oG4hDLiQrejMCI
         gb4bR8H4TObY4sBZoyRi2T6c94Q3/MpbxMca72reLRE60hAuCNRA6cGOkJVVUrdEg8kQ
         ja79ge0lmQuVjLLNBg82+MEIHsOXX0oXUyzgKOD57HOXY6gki1b7oa+WcjuPNxPSYFuP
         CzcpliJTi4OS/exWE7TJLFKOJOXXo7+v38orcWrS4V5+cdv1s9U84V1YIrXGrIgVx6VS
         xWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460333; x=1795065133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=fmUZvP8v9NtzUGb2Ja/0daBKpYZh8K66zJmh6OdYdbVx/27iqugs4uQRy7lcFrLpRU
         JIHe1+NewVPnAu21h7sTNNiKpkgWR/LroTvxemtSIatUuQ4A+JYNtlhUKR8xI8nhwSgG
         K6H0AnEMH8Pe5vRu+W3iwITd2tITdc/C/qx+onYHyFXMq4DKEA+Zcz/kr8Qq/2eZgHJj
         DEP2UNtX9kXrhNZ50duJP+Lg6oVXigM8kvy9CtidceSCphXDVkWe5D5hgLtDpbdoAOXG
         mJ4IOpGJZUkoYUDoOAzCs7uAHBeOT5A8MDb+ayKLGr78obdOjq6ZpRyeMNhEGWiGbmgG
         jL7A==
X-Gm-Message-State: APuU4Z+rOwiNkqjL13mvQV6RlNemqogDBsEQQUP5c9NdKV9gpEHYWJxi
	AbUkCmmjKA+KRJmKt+tuXUqZOlwj1q11UpSDOA35vqB92+jctEPB8Gycz+wQyRiTEZc=
X-Gm-Gg: AYBFou04dBTCZkvojUxj0wGTj4EfepMc4fjHQ9FpwllHViSh2V5N06aahaCsRpBJp9N
	jeYZIu2jF3yYpKgHggHYHPZfIUGt+56tdMGnKX3HGxdZPUN+r9wcmNwT2OAaQGD3PZpdx3d5Wst
	XKdFmfMamTohc5n1++hXdGvxwkD2N0i1uREaGve9J2VPFaXjbx7T4Tftb4O1OtrBETrktA2Mqa8
	5HVXvlR6hrvgJLaWY6qMi6WtrAtcGxH1xpVRQukzWNzUjjt1tw6/r98ADz1CG1kRbLSgOdIpZmf
	TjIL7pV29dHveDOpbTO9cZhHMYKHtfbVZjeirwgZqo3oL1VRzDh7pLzYb6CvCxT+xX1bAy3gbxF
	rN4gk0l+MsbAFteLo6fajlyU+MLSGk806PeO69x7XeSmEZf4MHNuWM4XxzvdFcC+J2GBr/ZV/iP
	e5a2k0nLT8MCi74yY6r8G3sk46Q4O26Buu+Or+Ao579Ea6HGttoH33KTon26Bqaolph4qJpifjo
	byNyMftof5VOGQzvpPlac2bspi7F0clpVXFiP5YzzFlPhG2R1saDKbNQ21dJmmAAz8Spj+7KpwB
	/H2Q7lJshPo2eCzCaiulljq/gVkPxdKkJbBo7nhnu+5g5j2Qo8zzcje3
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr4675175eec.0.1794460332594;
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Thu, 12 Nov 2026 13:11:32 +0800
Message-ID: <20261112051142.2797529-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

