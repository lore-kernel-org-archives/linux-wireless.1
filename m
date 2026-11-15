Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757833;
	b=FRDOAXSLTSg7qaxN9dtW7rN7tSh+gV2saP2z08SyCAe2sC435FzbLs7Lg0MZmpN6JiaC
	 j1nRm6iPPcANrAPFbDcfTEK4Be5hmR8H6KYSL28M3NRV4ADfgFe6NlyhfzrWPheHm0hCh
	 SV9OkKJoxwwR/VUrAm00DFj5UqtxDEj/b9J4EhuulaDflZigAbc8DskHQzXdtWSZYjGwL
	 Te80LzkArGoln9eHWkwsMe5+29AcApegog9fNsyL+j6cCTaqAaxwFa4AaGvRRxErISEk9
	 TGg/JKBqR4CX4Dqmd0brLtpw7LX2Qz+DDLfeYkoqAawk+oZMdTpI0KlBvarWUsqCHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
	b=Alv76zdR9gNzL94nwmoqLog54ISHFIu5jgi0f8ykTm3FptyV+syep2u9o4N455KBPwUw
	 fTIKbghBf7EE618um2Kaez8z/gYF1LKLnNTCp9rnKZO+w6dqt7TgKMfp2Wj8JV5ygwwki
	 UE3DcXYkorExMTHOEouh4xFNhotaurYGMXDAJWNnQuPR02WQFF28JFCzkQkTh24bV5I9k
	 VviQK1MhFXhpZOdCnEHtpZlamVfaeyAN00BzS7vxEi1xE6bLaHgve46cNboEiW3T7x0EE
	 KYeK+n9zqSL2hPMlBreJHvMzvgusnBXdzDm6OkOuSmz8fGIgn3UxqFj91BIARa5h1gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhK5fzVY;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4CE606A323
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 15:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4CE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhK5fzVY
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so7472696eec.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757832; x=1795362632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
        b=RhK5fzVYiPoen8qtpdo3n7NLlJOuG8woWahQeYq338fQj7LKDngxf5J/JhhkR8LEQN
         AfZxBsfrEqXRpC07/vWF1P3Yaqj2cN64l6/Ds9fOoV5iMJdXillL6Yo7mR/MP0Tp25FR
         pWfx4iUriMbhYt/+WSocDpR029emJ779asRkMTG1XzW7iQgsdW/0GRkeZcphvCm18Yre
         q86UE5h+9egVRVge6c5nbuSNpWg3qUqy1ItsqbE8MrydgzNmfc+giKbVgyhFX2Tom/vv
         A80GFu4GsUfOfheXpF5MKTJm09nrjJ5P1z8KydNNaZBvJlrdX4uAB22HULO6BVRn7KrA
         iy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757832; x=1795362632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
        b=S4ZyhQy+awDoQTJBXxXQGohG66w9bb4rMDRK3yU9esgaUbSSelnoN29JGodMtpa4/E
         5lfp7S9RS2ZoIo7Nz6UCHskgRnnM8qNt+hFfbITD07qyEShmiYdMmqBbHBPg5nz/HuBE
         /uPJQ8VwCHhx7u50VFP0LAphbXtrIT8WOwUttgUUe3Byikbv9npM/FzOhK/uRWge0odN
         qR8n/DKGzQFlN1a21MisawTPJ1JqwzScyVgrsfhzx1TpmQlkbft1VcE3LwZR8nVzZsep
         A1dKYxaPjpjBLUexBMzLD2h2341HiVHNvZryYdwQ2xApUD0Cx1pSbHr4JJ+MAvx2l8ml
         2Rtw==
X-Gm-Message-State: APuU4Z/9i/j2X2bYALs5krmGFxpQ3E4gHq8rQ7Qy5Ld7Asod2Dv0peS9
	YGV9lUvgvEFLEmeUeuypLPNtRogrJQSiqGY5yA/88OvtK8iiRJNzD4zXZ/cgsDssnGk=
X-Gm-Gg: AYBFou2AxQvCd5v9Q/5ywj28451YFqyHc2c9hA2Zxx0Pl+jkVXW9jrMLhl18PcMKl8y
	+DMRRNZbOLuuxt5X8OqAqensqQfGW3LYD5IX2Jsss7AdwpDVv8mhx7Slp5Y+Q53kD7GjYWoOYyr
	kWhqlEBwee8MNyt0lX2dAB44d1fcf43Rms89TEYqgn9NN/IrCHJlk4iYL+3kwpQaOWJQ3Dl2KTV
	AIJRuKKVDz3NQ4C3a+mSt8A13LopX49d57WoYqqMkW1ZCbDwTRvgayR0H+kOd+EJ+IQZuYi4W81
	z2hgevn7OAwDPc7fthx7isQ5ictZ+NihZFHimZ/lBmkP4eU1yD9rSMPw54tO0JqBRc+yv1Q18QQ
	TRbcWBwr6airT9OOHo9d2OHeuCHfD0KAGhnmjEd31dY+ISC0thgiMTYOzzL09DTfCz0G9BvE/gA
	1w/Kv4Mek4LpqPmkHZmBVXueMu43KZgB/7rEHLMXQ1rm2tCcAM8neVHHVPjj290O+kVOPRsS2ij
	9uL3EOf6510Xw3ZhIvMwu4Wl8B3UohvFZ6JREFP0Pc5WwMszbKYSt0AFiTDn+WuChuYtms3hrex
	BMeWVK2ED7dFwqW31iupFGpp/RVKOSjtpGypvI8dCiKGjAQIyjnGXW4e2Wsd
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7409773eec.24.1794757831293;
        Sun, 15 Nov 2026 07:50:31 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm25382225eec.10.2026.11.15.07.50.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:50:30 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v3] wifi: mac80211: parse wrapper TPE elements without an extension offset
Date: Sun, 15 Nov 2026 23:50:00 +0800
Message-ID: <20261115155000.82185-1-enderaoelyther@gmail.com>
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

From: Zhao Li <enderaoelyther@gmail.com>

Commit d160663ca2fa ("wifi: mac80211: fix TPE in channel switch wrapper
parsing") replaced cfg80211_find_ext_elem() with for_each_element_id() for
Transmit Power Envelope elements inside a Channel Switch Wrapper, but kept
the offset that skipped the Extension ID. The parser now drops the first
byte of each element and misreads the rest.

ieee80211_parse_tpe() takes a u8 length, so for a zero-length element
0 - 1 wraps around to 255 and the parser reads past the element. Received
beacons are parsed this way when the BSS table is updated, with or without
a connection, so a frame sent over the air can trigger it.

Pass the element body and length unchanged, as for a top-level Transmit
Power Envelope element.

AI assistance was used.

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v3:
- Send through git send-email; the Gmail connector line-wrapped v1 and
  v2, so neither public revision applies.
- No code changes.

Changes in v2:
- Preserve the author name in the mail metadata; no code changes.

v2: https://lore.kernel.org/linux-wireless/CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com/
v1: https://lore.kernel.org/linux-wireless/CACHPgzwtaykrULWEDNuWU0ZacnNf4s4uSsiYmxE_vJhS4jO0GA@mail.gmail.com/

Tested the in-tree parser with a ten-case KUnit extension under KASAN,
applied identically to the base and fixed kernels. The base fails three
decoding cases and reports a slab-out-of-bounds read for a zero-length
nested TPE. All ten cases pass with the fix, without KASAN reports;
the existing TPE suite also passes on both kernels.

Compile-tested with no new W=1 GCC/Clang, sparse or smatch warnings.

 net/mac80211/parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/parse.c b/net/mac80211/parse.c
index f3c5a9f6ec7c..7564d655919f 100644
--- a/net/mac80211/parse.c
+++ b/net/mac80211/parse.c
@@ -698,8 +698,8 @@ _ieee802_11_parse_elems_full(struct ieee80211_elems_parse_params *params,
 			for_each_element_id(subelem, WLAN_EID_TX_POWER_ENVELOPE,
 					    pos, elen)
 				ieee80211_parse_tpe(&elems->csa_tpe,
-						    subelem->data + 1,
-						    subelem->datalen - 1);
+						    subelem->data,
+						    subelem->datalen);
 			break;
 		case WLAN_EID_COUNTRY:
 			elems->country_elem = pos;

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1
