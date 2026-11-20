Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210153;
	b=YzKwCUZ5Q9VZoMWEib1bgXSXN2MLVYFyKVswTIrcbIpBP/+sPn1aeR2qIzi6K2buhFYp
	 lJ/q4M4cgpJjXXGR2SLP9UTK2mo/d/YjTUT1lBrTnqoonwGAcLq6sq4J0GptVxhnCI7NI
	 ZX46v+mWM3hOAKG+IypZuFsGNggzzgMj7GAEJJu0ypztHb83Bhhn3r5nPPfP7TDsSrpIu
	 XZCgO60TKZBvWNmoN2/RwdnUZlr/OXr1nr1TVF59ns3KBXQSMl+zym659F9pEbE92hUz1
	 ADC4RXuXnacw5+325dO2hu0E2cCr6h76EiFDceHxbdIoLwCK28ZvvZkhzZUHaEpMG0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
	b=E2uuPRHnD+AUZXptgEhuW7iGFgMyQi/7urPXls6qC97uumiQTXaICwuf4iKxJQBU0/CV
	 BF8D20x7hHioFQeZbZVCHZs467EQq424cAqj14XCz5iWbwNi6BDCu2+u3IynSSXBF0eqy
	 ru16scY8djrNSwre6GqDzNDQ9PEdfXjj2zLOfhewLO8B4qpJoKNIF3OfKk4z7w0KQGMQ8
	 +sqeY7nQJqGf5VIdrkxEsh3ps8bROoYWVdJvWfTyJY4tYW1xuh6Jp/T7Ps3pOAt5+R0C+
	 SG8Y8MWrD8prRUDJFTphANc/RFLZHTIPggp61psXKand04ql/iIQIsrvFrze3B9DP/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuQAj3sa;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26582606A684
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 21:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26582606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuQAj3sa
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso516590e0c.3
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210147; x=1795814947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
        b=GuQAj3saQdXCDa9aobPR2y7rJ1ST8tMdTFd9D9LRo+H/hjqGMY5/LQGUIWb/r+jxFA
         z+rvM8ElYpoaTxdwei476vbYYWpbwIgrU19fIzFT76zqhVnoads2aM5Ffv26F3PuMyw6
         KFSVSRSLFkw9OeT2+/2fT2YnpxQByTfJeJSskmqJZ0m38817C1+m7ReZ4sBQQYWvqbip
         0lGtd+ps+lSFBHSL3pPNovOZsiaJzpyznOLuhqnjudnA4Lz28YWTTuQjKo+ERugCKxH8
         bc6N5XCBM1H3Gui2xqbSn3rW4nOlnGjkiM3YfKnE1ncOUr+qe6askR3Xz6U+kcCNwXfq
         nqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210147; x=1795814947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
        b=l6ZyUstVC+w1+o7HMhlPTVeggU0/KAY7eLoPFSR4k/WRP/EKXWYsu+t136cpze5Fke
         uCxdhszJ9jSTfDw6Vs5mMbyM9UyCdAzilgp64YvV7GsA0SpG1cmXcrhWD9Cj8ijlqMW0
         Wn0gUe4Ji6sqQ5GPXO37NQvvKMNNgFUpM4ZBRB3d6mHXmKrs2eX7lpoIWIKP+2QZrllB
         a2msDHtIwQN7cHSQMHY7g/7dyvJgvHKcfEwthlCME7N3R48kFwHoVHiW7hYe6LOzVujr
         Bjmd2mwlykJ+gjzPEZFoGO5u5m1VUcLYGHVEtZTbH5nHRdyD4UCFB0z6+QhdK4yfaIDU
         DCTA==
X-Forwarded-Encrypted: i=1; AL+hErEMLkYXTi48DB8WL/OkWl7tIYGlOyfeNS4TmgSVEJ8Fye4+9CXskZIdHjAmjoZJUBX7Wrh9istzMUIqDcsFeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRae7RXQ0y/xamM76gZKrK9s+lOvYQ2fGigQPlgHiHNN2dIZ4
	3Kw+hIhKKMG18P/4pcLG1AZ8UGF7CpSbM/LUxERycorvG8DBQMcRgy+d3GisuvTiesLMRg==
X-Gm-Gg: AZFdTZdj5J2xoIBheqabW2+FxIGfm4yVsIdKGvQGiBG4TgO6Rm2nvqs1PR6/3kISnLJ
	6MTDoYT5q/TaLG3j6k4yq0ej2OI4FuwcWJi6IcpOhpnuzO0q9t1yUCH4ktN+XmDV4iicdUTfsoK
	WV/mBhnms8uNCra4FW4kecK9AV81vpMNvkIQzkCIhNsw66ygkza4fJM+Tu5arVqmGRuZnluDuK0
	Xedo+notZYkfD9eEC0VDIn5Nw+dvPBfeRIqrwAzA2nJV95ymzJiXUZ/GxTfiMW5m9O64GlZXa0O
	CEiO/VlVRXG1X1Y+Y7Wb7KQxtg85nDalY5dSWrT5Mhu+KNuLCfHexX2ytiBCJrQU8eRyYIosgq7
	uqU/Tv/7c2MBc9BXhoSwUoOBt6+CUNla1tO6xVdDY3CWqubktSwO7CS8BxOl1ZqDKiS0mRrDTDu
	6lE1NppU9l2w/B9bqCgAFDElcOAGQHgJbzrxasbIt+m8v72eZ8DKdfimkcvOZIT+96uO+103Lru
	nNSYia9NFN2m4jqxfDG9q0Fe9UGeyRFFbqRI9N5BY3W/7ivZfQ3DiAipqBV2waCGCjRhNVwZKEq
	/zwVN+aGad52Pc55+DfFigYEqNeJ4SdNGo6R3qPdGkk=
X-Received: by 2002:a05:6122:7ca:b0:5ea:fae8:e69e with SMTP id 71dfb90a1353d-5ee8aefbc08mr2508517e0c.11.1795210146967;
        Fri, 20 Nov 2026 13:29:06 -0800 (PST)
Received: from arch.localdomain ([181.80.89.146])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm3709291e0c.1.2026.11.20.13.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:29:06 -0800 (PST)
From: Paulneja <paulnejacontacto@gmail.com>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v2] wifi: nxpwifi: bound the pairwise-cipher OUI walk to the IE length
Date: Fri, 20 Nov 2026 18:28:54 -0300
Message-ID: <20261120212854.25239-1-paulnejacontacto@gmail.com>
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

nxpwifi_search_oui_in_ie() walks as many 4-byte cipher suites as the
pairwise count in the RSN or WPA element of a beacon says, without
checking the count against the element length. An AP can send a short
element with a large count and make the walk read up to 1020 bytes past
the end of the kmemdup()ed beacon buffer.

Pass the number of element bytes available at the suite list and reject
a count that does not fit, as commit e667aee1c192 ("wifi: mwifiex: bound
the pairwise-cipher OUI walk to the IE length") did for mwifiex.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Paulneja <paulnejacontacto@gmail.com>
---

Notes:
    v2: shortened the commit message and dropped the Assisted-by tag, as Jeff
    asked. No code change.
    
    An LLM was used to locate the bug and to draft the patch. I reviewed it by
    hand against struct ie_body and struct ieee80211_vendor_ie and against the
    mwifiex fix.
    
    Testing: no IW61x hardware here. The three functions were run verbatim in a
    userspace harness under AddressSanitizer with a short RSN element and a
    pairwise count of 255. It reports a heap-buffer-overflow read before the
    patch and is clean after it. scan.o builds without warnings with W=1.

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

base-commit: dcf495789037ab78d8ddf5844239cf85d92ac5f1
-- 
2.56.0


