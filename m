Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428663;
	b=DUvyAoOOHDqGUiB+wKoV+tNnk8PQ2rS4VgwGYSs1f0LB/QbGibXBQkXC69eWbnBUfqh/
	 z2dPaK1rJlbG6X3g2kNGRQqtbt151DE/IuLwnIxonMfBm+TRJXYjxYV4+LpeSOIut6iE1
	 xH7rhXsPZrj9MJbtllo41jW1pkt0mBpVKP4bmT5jj99/30H939bkqOnTaMwcQVTFIgPIV
	 sZrg+dKYZErFIWmeZA10ozdLpIRoVJTqenex+4w4GgY+puL48z6YF/Vj+8VUrRsK1g4fT
	 451GkneK5LSXF3gSKf8Iu5/L29P9+YtopoE71d3Yid9hpoGajs/LiVO2Vh3QziQ7cGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9gNZbnnmQRSiLzFBbi7kiD8rhc4SFZm5dcIY5DLITj4=;
	b=ePUpUjEm+BImnnqLnHoCjnCHWUFzSFyI9dYHnDF5R2caz/hubmkeIy4Qjhfie7jcjMai
	 zcc3YQJxH1d1YOQZN8xCJouH4TJtrggH6fhaaTN022iP6/rDH57gSZV3tCYmeHwni6ifS
	 eQJYt/Nvr2ys8cFgg6np0a9Y5ZI5HC8gSbcCv7RbSJ2SVj5sChI2T7yIquRfTkZo58upR
	 CnH6E3PxoZL4NlH3QEDgfsBp+btqTqeIYM4Gbd7BACIOEvZf3Nyr3NjPhmayCXKfwnUxv
	 FaPl2qfGG3KtfDgz6hvBBT7n00rl3MWk4K9mnGAPpavZiyz1WvG6mturjOpAnW0dtNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FytuutyS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678C606A32D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2678C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FytuutyS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so8592688eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428662; x=1796033462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gNZbnnmQRSiLzFBbi7kiD8rhc4SFZm5dcIY5DLITj4=;
        b=FytuutyStG27HQ68T38Uo20BX65xGHkEC48ZM7pnWfhEZ18aL1f6Pa2bB2antaeo+s
         DIyvY7D31/o3uAKQmlHFDV7hT9jOkWsah4ud5V+/zSQGZeJMx40hLRDJN24qNVD8z7bb
         gNTsltcTy3e3hyNM3AS3Dm1NPT5DSZme7VcRO7T2wBWZGZrFHsDzlUvJFqkJmKCnZjyf
         kxM1IngOEA9sGcKU5ECoqUa0b4/LZMysB5Qm14p5jtqDWS8MZks3o9YT0EMDb5wpm5XF
         t3KErKVzNWuU1m7p6DrSb6M5NuuPavE+t5GarFCUlL/sU/k9HUWDQMTDJOxR3BC7D/by
         XYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428662; x=1796033462;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gNZbnnmQRSiLzFBbi7kiD8rhc4SFZm5dcIY5DLITj4=;
        b=23i2wKat6sabaOxacegJFlKZQI6UsXUfztQbPqnFvhU04Ta9t6xsw7Alsrrm0dYPyt
         sS7ukgyVH277mW0x2fYebMGKUwcd3cOgb1Fq9r2Dc9Hhhp/ai82nmdxpxdsG38csexCL
         Rc9Ew+eOQ14/V20gIgz7a1cvHf8dtsIW+OJLjxkB4kH/S0buuruieQv1crYHPc+d3CtY
         HqpfMiTJJn0iGdyksh3RJ7l9gOHOyGvxLp6QiB4Fp++dBP78bjAGKXBi0Myy3ICoPmeF
         4yPNcP1jU4HryMLJnts6RXWUXL/HjlPt6kVJdFqyKvs11ia4ISs+NPj+1z3tE5mukdUx
         d00w==
X-Forwarded-Encrypted: i=1; AL+hErHp5ZN+2EXeEYSSSvibCD5Imj4o0w09T3kOCE/Q90EzQH0RmLuhmloDeyhWSYFnaDmA1ccnHV3XlpNkNByE4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q2kP88fUcXqHQGRhdy7R5Q99dFuZnYR6Y81RfS3PcEz9qBrTF
	+a8dJUjQZ6ZxCx9LHbueoyuRhKpWAypof+Z+Tp+NRVuJsW1hUfjucAzA
X-Gm-Gg: AZFdTZeEgPR69bb9Q+S9Cuh/CfyP1D1faOzlsDZktRvwrcK+xsS+XqUgAgglW5mASUD
	6BSSr9M9zuTCLdrf440l/V9n1yZCOHS8RAGz4zlsGH3O1SHV88nRsMF4NzVFdRf2I5yfCI5d1Sh
	HxAsi9sEgCYdvV4N0+0bOAxMEb5LjK9PnvLZMeF4gGpTJMfgj1kzcJj8pdWzlsc5Cr38Lho4GaR
	vOQf8pZpy8iWcMpc8Fiq1oVDgrhj7t9mRC7nPPwx6EN3tiSHkFg34Vh8DLkRCUZZulRgwPe34Al
	1bY33vyLGpDXgU5nkvNGElXZqGq90+9D6LEOn3GIAt7eAGRW+FiHsEn7cjsaJAnKzQicpcM+Y3o
	DNGjNM7+ri+9e/laE0zSD45msW0g2gJUo6eW0fKNd/Lkq0ptPmy5mblEiNgygZks4ukUprbCYP5
	l6LQvmMbLzAWvkioLeGAwn8t4Rvkp9BluHmfug/30xQAIYugV5s+vu8pQmVK9J8bf3yTNzbV5vD
	czojCLrISn+8T6pddaOlNTpidKN7ceStkhSm1Lr/bzST3VBnK4NkF6LWCQr/PN46aHqPDLPLWAG
	l6O/HeECUJIIYSB0PjfZNk3N5zKpSlqiZeoffZ7vM9qhvYHRY9fr2y/yZl56XZlLEsL3YeWdjpK
	EDV1Xu2aZRj1KEwIgvg==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr11502093eec.12.1795428662292;
        Mon, 23 Nov 2026 02:11:02 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2009:6412:a5f6:d81:c3c7:7d8b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm36011834eec.12.2026.11.23.02.10.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 02:11:01 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: security@kernel.org
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	phhuang@realtek.com,
	gary.chang@realtek.com,
	linux-wireless@vger.kernel.org,
	Tanuj Sharma <ertanuj96@gmail.com>
Subject: [SECURITY] wifi: rtw89: OOB read in beacon/probe-resp IE parsing (OTA, pre-auth)
Date: Mon, 23 Nov 2026 15:40:21 +0530
Message-ID: <20261123101028.58146-1-ertanuj96@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I am reporting an out-of-bounds read vulnerability in the rtw89 WiFi driver
that is exploitable over-the-air without authentication. Any device scanning
for networks with an rtw89-based WiFi adapter will parse attacker-controlled
beacon frames, triggering the OOB read with no user interaction required.

Severity:    HIGH — over-the-air, pre-authentication, zero user interaction
Attack:      Attacker broadcasts a crafted beacon; any device scanning with
             rtw89 parses it. No association required.
Affected:    v6.4+ (core.c), v6.4+ (wow.c — verify merge of 92790c4e50d2)
Fixes:       c6aa9a9c4725 ("wifi: rtw89: add RNR support for 6 GHz scan")
Fixes:       92790c4e50d2 ("wifi: rtw89: wow: parsing Auth Key Management from associate request")

Impact
------
This is a remotely triggerable kernel heap out-of-bounds read requiring
zero user interaction:

  1. Remote denial of service: The overread accesses memory past the
     skb's allocated slab object. If adjacent memory is unmapped or a
     KASAN/SLUB redzone, the result is a kernel oops or panic — a
     remotely triggered system crash. The victim only needs WiFi
     scanning active (which runs automatically and periodically).

  2. Driver logic corruption: The overread bytes are fed into
     cfg80211_find_ie() which scans them as if they were valid
     Information Elements. If adjacent heap data contains bytes that
     match an IE tag ID, the driver may act on garbage data — affecting
     scan decisions (core.c path: 6 GHz probe cancellation) or WoWLAN
     AKM parsing (wow.c path: authentication key management selection).

  3. No user interaction: The victim does not need to connect to any
     network — passive scanning of beacons is sufficient. 802.11
     management frames are unauthenticated even under WPA3. The
     attacker only needs physical proximity (WiFi range, ~100m outdoor).

  4. Widespread exposure: rtw89 covers Realtek WiFi 6/6E chipsets
     (RTL8852AE, RTL8852BE, RTL8852CE, RTL8922AE) used in many modern
     laptops and desktops since v6.4.

Root cause
----------
Two callsites compute the IE search region length incorrectly:

In rtw89_core_cancel_6ghz_probe_tx()
(drivers/net/wireless/realtek/rtw89/core.c):

    const u8 *ies = mgmt->u.beacon.variable;
    ssid_ie = cfg80211_find_ie(WLAN_EID_SSID, ies, skb->len);
                                                    ^^^^^^^^^

`ies` points 36 bytes into the skb (past the 24-byte 802.11 header +
12-byte beacon fixed fields), but `skb->len` is the total frame length
including those 36 bytes. This means cfg80211_find_ie() searches 36
bytes past the end of the actual IE data.

In rtw89_wow_parse_akm()
(drivers/net/wireless/realtek/rtw89/wow.c):

    const u8 *ies = mgmt->u.assoc_req.variable;
    rsn = cfg80211_find_ie(WLAN_EID_RSN, ies, skb->len);
                                               ^^^^^^^^^

Here `ies` points 28 bytes into the skb (24-byte header + 4-byte
assoc_req fixed fields), causing a 28-byte overread.

Verification (kernel 6.12.115, KASAN generic)
----------------------------------------------
Code audit: The root cause is mechanically verifiable from source alone —
cfg80211_find_ie() receives `skb->len` (total frame) rather than
`skb->len - ies_offset` (IE region), causing the IE parser to scan
36 bytes (core.c) or 28 bytes (wow.c) past the actual IE data.

Production trigger requires a physical Realtek rtw89 WiFi adapter
receiving a crafted beacon; verified instead with a kernel test module
that calls cfg80211_find_ie() with the same incorrect length calculation
applied to a kmalloc'd buffer sized to the IE region:

  BUG: KASAN: slab-out-of-bounds in find_ie_kern.constprop.0+0xe0/0x100
  Read of size 1 at addr ffff88810e1ab864 by task insmod/1901

  CPU: 3 UID: 0 PID: 1901 Comm: insmod Tainted: G           O       6.12.115 #1
  Call Trace:
    dump_stack_lvl+0x93/0xd0
    print_report+0xce/0x660
    kasan_report+0xe0/0x110
    find_ie_kern.constprop.0+0xe0/0x100

The function cfg80211_find_ie() is a production kernel API in
net/wireless/scan.c (unmodified). The OOB is in the IE length
calculation in the rtw89 driver, not in cfg80211 itself.

Proposed patch
--------------
Replace `skb->len` with the actual IE region length, with a guard
against underflow from malformed/truncated skbs:

--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ rtw89_core_cancel_6ghz_probe_tx()
 	const u8 *ies = mgmt->u.beacon.variable;
+	size_t ies_offset = ies - skb->data;
+
+	if (skb->len < ies_offset)
+		return;

-	ssid_ie = cfg80211_find_ie(WLAN_EID_SSID, ies, skb->len);
+	ssid_ie = cfg80211_find_ie(WLAN_EID_SSID, ies, skb->len - ies_offset);

--- a/drivers/net/wireless/realtek/rtw89/wow.c
+++ b/drivers/net/wireless/realtek/rtw89/wow.c
@@ rtw89_wow_parse_akm()
 	const u8 *ies = mgmt->u.assoc_req.variable;
+	size_t ies_offset = ies - skb->data;
+
+	if (skb->len < ies_offset)
+		return;

-	rsn = cfg80211_find_ie(WLAN_EID_RSN, ies, skb->len);
+	rsn = cfg80211_find_ie(WLAN_EID_RSN, ies, skb->len - ies_offset);

I have not shared this finding publicly. Happy to work with the WiFi
maintainers on the patch if any changes are needed.

Best regards,
Tanuj Sharma
ertanuj96@gmail.com
