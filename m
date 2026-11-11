Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430777;
	b=rhCRqw4Q7ydunjMo1SjuSANOC9eTHkojfGtE3fKb8yvCCB73xDWZuyVgnneYywKlQR57
	 hfWxOy32gs5d4vDsETl2fYd5YqDR8Sido7zD2H7jg+UlKJMKRWzxqIbANgD2qYeyyyBwU
	 HFM9/zSrGvVXYvGdwhH1v2XyKz06sXl4xiCuTzibAtUfhW2+xhNG7CRETpjEvbwyU40RI
	 usEB/77DYpi5TC+LR6oX58EmZGWmUAvZZUE08mAaizDCAO6rYtY/qPqXP7HQ1OQY0wf0c
	 zB9WtMPL0DqA+nzrrdbRj0GB9tBHtwG1a1Ze0gi3aBSl0NHlXa5xrUJhb75Qq1EGPxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
	b=mSyF3kKYB8WDDyaGTi1ELYWPGU63APPfc9UHJR06k/oDSRA9QIWVsx1zdX43/MPPnpI/
	 aItKHk0VclF5OydDP7hBaa/pf6S/vCvN1UdC1xz851BRLJ+s5N0ARkyq5ONr/31mhogz5
	 /8D+Bwd/7kaQBdHKvhKt5khF4TFWDh/suol31INlGnSiHVHAL/PUBjpYo8aWXgGbrePlT
	 Rcz8CBMDocd6lOGD35W52FofTi+lFF7sfngpCYOzndYe1SdUe9IaGO/HpD5GRNZ0KUtzI
	 d6SN4c5sihjwg5g6oo38WYyo/aE21dYwTayDI3QjdVGglf4LN88V8enL6fPXJxf3KuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mGWdMTr/";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404E606A335
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 20:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6404E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWdMTr/
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so37862627b3.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430775; x=1795035575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
        b=mGWdMTr/KQ7vH/IPoTFIhiysUV823YvNf6fvkFuwKiQ3NxaKg+NM2zNQqD2r0027Nz
         81VzhVCLmn7sq1o0LSJblLgtWzpsC6JmY3oQcsXmgKcgqGB/UVzvSztfWS8iuVF8BvPP
         ql70x5/5kJEmEpsDM8k9rbN2s0+nFym3himOcHITtmnRwqdZ5c2AzunDMjhwBA3l32KF
         QJljzRJGj626wksqBEA38TTKHlCMNW08HYfpuZBIUq6uALPEglhet+vFgJ72LAEglKTi
         OFtA59qK8o6RukV9A87NYgx9P78wJRq3nPs5VlKvMBnQG74kf2DOKFlY6SRKtJHLFCM1
         Fvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430775; x=1795035575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
        b=rrl/qq/X5hxOr6JGISlfL0tbr6YHGNU3jVkq98HVIH7kvJcsUCHS8zKi4LRbU40vWD
         e/jHZYkUhDMPUnoKvU114BzBORUBE+8/2a04VIRTFbeefzC82v+Bjxu53iKJ9uJkTgJx
         ald11fh1C+viW3Zo5LBynHn7jpzz8JZlH4VRtIY4EE7/zPIfu3MUoAt/6gge2o4X1FFm
         YLzPi8Zb+1++X9TvEPLFGV4p6nHODa7leBB1OSHPRuiBceNl3Wy5uNQP+0+/jybnjc7t
         2o6YAZWRCS/Sy0JKsdk8dsCgaUlr3TpnESByeg34JcCTokFvihUFxPHnMIRqiavro1eB
         n8Cw==
X-Forwarded-Encrypted: i=1; AL+hErFPcrRGxAIvZ/9YPbOfh8ufXKPixe47XbiiyQFW6UBT5VP1X7Zck4kCUdEYHw/lcGC+laxLn7BNiLQaXoUqGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3wywRzzYVxk7IgexGP1ZaXTkTEw9CzQPYjPEY4FLYLqk+jMb+
	hN3pkNI5OgQWyzHTtofFCml6g0UprAnIMVJArQ5j43Hed02yRUtaP+oV
X-Gm-Gg: AYBFou32cJurIwHBgt9XfXkt8X+V0tJH9jqlFJZ6OjVHbvjg2um4bJVn8/jV8hNMtoO
	tECYYh9w7A1R7ih4uTeIXaXwbsmhufNDe0To5ZBXJ/Sr1OzTVeudWlsfj3nknp4BfmTCkTb0NjF
	o+KdwTDBR0YWsrFei0dngIpDKvi+2sr3NpSNMmzhIv859pCZX+FTqraoK0azen2jUkUsEaY27+Q
	wRKQoo1ptYPEEo9jvthlqVQn73Raq4Bl1D1s6HvC9ZYU8/2TAbhggCK5u2tq1Fev7XAx/kqvUvN
	wAu9HZ55x27fimyfSAGPyAqQ9cDItxbI99fl5fEH0gZ4twVSjCtGfuB9votP1k9SjQSR/PzeZ+2
	XXMzGapzd4gn0aU5QfbbXbiESBVmOA+IvQGbB3VByv0ImKLHvmQtkIv+8c3lZGCPtS+9biUOudb
	MrYyb9dn+GYbW/N+Zgjrbpy7UzkNMk2YA36cN+7iLB4eCJrUoKLYCg5QYI50AyGNCe2kGhAxXIj
	aBBC5WxhQk4DL0GK+w5BoGn7Rsr++/RVW2uHsJmOTRjGJx+Xtzr6e5j4Clbu1YPIo2Jgy3svroq
	u94eZBZxkt8GzAOixqj/qOrrS4QzguGHE/xZ6Kw2ng==
X-Received: by 2002:a05:690c:f14:b0:8b0:cee8:53cf with SMTP id 00721157ae682-8b3a7dba91bmr29416207b3.3.1794430775289;
        Wed, 11 Nov 2026 12:59:35 -0800 (PST)
Received: from arch.localdomain ([181.80.92.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934592e9sm52910477b3.40.2026.11.11.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:59:34 -0800 (PST)
From: Paulneja <paulnejacontacto@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: nxpwifi: bound the pairwise-cipher OUI walk to the IE length
Date: Wed, 11 Nov 2026 17:59:17 -0300
Message-ID: <20261111205917.449230-1-paulnejacontacto@gmail.com>
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

nxpwifi_search_oui_in_ie() takes the pairwise cipher suite count from the
RSN or WPA element of a beacon or probe response and compares that many
4-byte suite selectors against the wanted one. The count is not checked
against the length of the element, and the beacon parser records the
element on its ID alone (the RSN case in nxpwifi_update_bss_desc_with_ie()
has no length check at all, the WPA one only requires the OUI and type).

An element which is shorter than its count claims therefore makes the
walk read up to 255 * 4 bytes past the element. The element lives in the
buffer nxpwifi_fill_new_bss_desc() kmemdup()s from the cfg80211 BSS
entry, which is exactly as long as the received elements, so an element
placed last reads past the end of the allocation. The walk runs from
nxpwifi_is_network_compatible() when a station with WPA or WPA2 enabled
connects to an HT-capable BSS, on data that the AP controls.

mwifiex, which this code was derived from, had the same walk and was
fixed by commit e667aee1c192 ("wifi: mwifiex: bound the pairwise-cipher
OUI walk to the IE length"). Do the same here: pass the number of element
bytes available at the suite list and refuse a count that does not fit.
The length stays signed so that an element too short to hold even the
fixed part is rejected rather than wrapped. In nxpwifi the vendor header
keeps the OUI type in a field of its own, so both are subtracted to get
the bytes available in the WPA element.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Paulneja <paulnejacontacto@gmail.com>
---

Notes:
    I went through this by hand before sending it: checked the bound against the
    layout of struct ie_body (the suite list starts 6 bytes in) and of struct
    ieee80211_vendor_ie (OUI and OUI type are separate fields here, which is the
    one place this differs from the mwifiex fix), compared it line by line with
    e667aee1c192, and ran the test below myself.
    
    An LLM was used to locate the bug and to draft the patch.
    
    Testing: no IW61x hardware here, so this was not run in a kernel. The three
    functions were copied verbatim into a userspace harness and run under
    AddressSanitizer with an RSN element of length 8 and a pairwise count of
    255 placed last in an exact-size buffer: heap-buffer-overflow read before
    the patch, clean after it, and a well-formed element still matches.
    scan.o builds without warnings with W=1.

 drivers/net/wireless/nxp/nxpwifi/scan.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 4eeba6700aa7..33779e21336b 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -79,12 +79,20 @@ _dbg_security_flags(int log_level, const char *func, const char *desc,
 
 /* Parse a WPA/RSN element and check whether its PTK list contains the OUI */
 static u8
-nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui)
+nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui, int ie_len)
 {
+	const size_t ptk_body_offset = offsetof(struct ie_body, ptk_body);
 	u8 count;
 
+	/* ie_len is the number of element bytes available at iebody */
+	if (ie_len < 0 || (size_t)ie_len < ptk_body_offset)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	count = iebody->ptk_cnt[0];
 
+	if (ptk_body_offset + count * sizeof(iebody->ptk_body) > (size_t)ie_len)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	/*
 	 * PTK may contain multiple OUIs; iterate through the list and compare
 	 * each one
@@ -113,10 +121,13 @@ nxpwifi_is_rsn_oui_present(struct nxpwifi_bssdescriptor *bss_desc,
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_rsn_ie) {
+		int ie_len = (int)bss_desc->bcn_rsn_ie->datalen -
+			     RSN_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)
 			 (((u8 *)bss_desc->bcn_rsn_ie->data) +
 			  RSN_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}
@@ -132,9 +143,15 @@ nxpwifi_is_wpa_oui_present(struct nxpwifi_bssdescriptor *bss_desc, u32 cipher)
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_wpa_ie) {
+		/* data[] starts after the OUI and OUI type */
+		int ie_len = (int)bss_desc->bcn_wpa_ie->vend_hdr.len -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui) -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui_type) -
+			     WPA_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)((u8 *)bss_desc->bcn_wpa_ie->data +
 					    WPA_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}

base-commit: cb1edd20907e13b058c0d5bd34c9d51b5bedc879
-- 
2.56.0


