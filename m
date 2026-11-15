Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794748205;
	b=MCgQZqmtfEXnRjDH1b/MyRM06D3blaexlff6nOUBijUZNIHo4kfVK4y4HPtoHSkTPNyS
	 LFrZFvjeRf089PTJNSSYM17SvX03H1Uf5vYWEMOnNXyfiSG0lUeYsnVNdksl+4EuJF6Uc
	 lPIN05GGCYfzOqyCMpt7cwk0opBR3uM9LcL3pfs8zJxEXhjlfkg/kpfq5mQ5V++Q3St/j
	 VEyyHSJv5pTu+i+pkjmterb/7vhIB2EwQ9ECqxMtaauhdPVwh1/EHzQcMJZcS5ZqyQan0
	 Xt9c8Esyr143hfeZ7tMpWByWP9enc6xccpiVhrxKxkVTmXk4IcYZqm4T3Ib3PO/IjKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
	b=qa6yJ0IuRS6Gx3rL8vcsWEPgXg7s7vGjp9On/53TuKEMW92NzgTAOzkJh5gEDPyTFFm2
	 L6hqSfZBpYuxttGqiK9me32nWzJD8VGpyHd4t4WI/rjKSDYAgei+LpyYrZN31Iv+39Ggw
	 xQ27Flb2tLyJh9uNw6h/F2Y2fKYTmMEFZGvTonZ0akXD/kLoRHm4QWJ21YYUAMakW2OME
	 1qUpVymGoS+p3jZnTtfkBI74dGn9MXL79vMdJ8uGSigB361LFB3wZ1uQUxcOyFq33zNdD
	 /eawcX7ssGr0D16tWkqyQWOQAJBXpPe89s1jC9DNu3BhJjId5NHI4blOhzf9O51B3zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3NNkXn7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D5606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3NNkXn7
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ee3a3d281fso1789236e0c.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794748204; cv=none;
        d=google.com; s=arc-20260327;
        b=ejBRsLs2gfEJiA2zYUtzyF+yQXjRfOOB1OXbGlzP/azSAqkZ//ZpJD9+YMY988VWPI
         AgDlHBQ4xuZF+UBya8st6IqMGkUuhXyYDtjrfHR9ZfIL3+KCVCUw3y8JnkaajYeNkKir
         APTJSNNaYSeZlr16vu0RxRNq/d1zjI++ktUachgKC5cIOwghrPJrlpx68fV5vd4vNE97
         JOvuzu4roMLy0+//N54QMpkS2kgOlHqYkSxnWetPKLTW7i7B+rc7rjcix7u4inUqpsgZ
         9To7DpYZ52TtiFU5QngwKQ+iU05aIrNghUOwt03CQhC9DH9+S1WJkn+87TyPTZfxF2ce
         8drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        fh=8IAy5qup0a2EY8QRGpBSpKR+Jn4fWjWAV5x6xozgXOQ=;
        b=YIcfJdcQhFEZ4LPut5BHFCEMEL9zXvqgq290Jlii2fJb+ITIhvbEa7c2waIR4C81+0
         Papa3YkGE6ajyEX7wdJkozK8IEVZpcf75hZu/VAgNME1T2GfET2Ish/8yOUlhWJLTNli
         c8N4R6vuysXjxtOkYR/LPqrKJ31jsV3dMaA79MSfDsPAM6rhEwxlM4OtHcRR+PaRieAq
         fK5TPmQNqkA4eDoA5qCATpdCNG+oWXiQn3urrSc+4Py5j1OwfCzqUOewvfNBAOESH62I
         xMYRlnZNYqWsZb9/eeeDVPb4gO3tAR6wrMqj6VNQ68OA4EvirLCPApVdqRRf6g7FS+G9
         9VCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748204; x=1795353004; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        b=E3NNkXn7Kkk9+i4V9F1+LHx0gAzP+7aI5lToB3DkMeqpU0R5DuxoyhKQJLgywIu5Dl
         Df0+kqpXxGxnqFpfMiN3Cw4aDdKZnL8Z5GcjpLgnIEF18naQolTdZxRkkZeKSJXlV3c0
         Iv7jXdrdWP/mc85q31sblc2xhS8v9aGVUHRnPJvd7lUHIuNhMVmWNPWGxuDuEEqKb2VE
         7NwaUDpZzGo9SUCS6XrYGzL8Flo2WbHni3qFe5vAT9O7t1fNcSDG9QBZ00j4OG9X05mi
         A1/FBzDzs6td7a+PgimezQyLXPXM5wne+L366jhEbQsOWUTIla6UpL/vWfEkDEZMsdiS
         SsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748204; x=1795353004;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        b=smP1CSDb2qcb5xeoB+eRTCQfo0e0LPuJRm+jNbxKYVouZE26GUWv68AMyAmznqE5P2
         wkxxtAsXaYHg19NVb2uVwlv3DK/aKqqh0dgtBBXA/XJT9g6WmKEPF6EjznwDaSOpmLz/
         re1GDoRAECdUlShJe1ohhNJ7PcviTo3slhqy5/7Ol5cvkoJ3I3qCqVCQgmMkFfxzXD6y
         bq2uHw1zI+iUlhLykH5+JKsE+XMRcxy9dRGHcadTfd8vqXNpdMhAahQkA20HoFewovEO
         +zjmn6Ta7HbsxS0R20q88CVjsrWVJNaHhJVaYxvO0D37JZeAaL7tFoqVaLKqMiwFDAhp
         PTcg==
X-Gm-Message-State: APuU4Z9Mxnyrdz9ZeuFiDYXfDhZWk7pdneulo/+NkA6IZeMdfwRnWIed
	DXl1MnY438rYCHI5Wz2wwSKMK8VA1SIozJUUrVr2BURz+TQMgknwS8+ria2gCvLFVlhaaIwKD5P
	CHNR5gptfmPlnjyZASkTXnarXo/3r42wcMw==
X-Gm-Gg: AYBFou38k7fEdcEM8UDblRxm1fD36Dwl8vPJxoCAeMx0yddx05m4XvL+cfajfV7y2au
	2Y9DhdpKJY/Z5UYsNqj7U5BZ8RplRioZUx+VxwW3Fg9zbGSTNQf6zwqTcpAka2jA7e7csxM44Ty
	LqVF+g08FP6CZXHaR7u/LseWBphLU1mGsqUTVkNEeEDG5Z4IH9Kuzf8xSRSQ1Xe8iO+uRL+QZLD
	bh8fk6dFwb8L/Q5ZpK4HwLhVHYSjB/i++8hXD7Dv49NMjw8KJNp2eFAPgmZPhONH6WLLyDRAWdj
	O50KNiGRFgGK8zhfUY7Bebvz3tSvni1PJlRS1otPOZlMMjPh7PsIKa/XPOwQB9+j2ewzkQBP54c
	UKt3tK9jOyB5EoVzyHIV/aL9m9jnTmbc/ls+f
X-Received: by 2002:a05:6122:1b8d:b0:5ca:856d:cf80 with SMTP id
 71dfb90a1353d-5ee34a7e643mr3049835e0c.11.1794748203388; Sun, 15 Nov 2026
 05:10:03 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 05:10:02 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 07:09:20 -0600
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
Date: Sun, 15 Nov 2026 05:10:02 -0800
X-Gm-Features: AclHuK92OLe_ppBLr7loZS976QSMB3kkhkT0NjtubDh_jhqXCnkEGQD3vj8y5-w
Message-ID: <CACHPgzwtaykrULWEDNuWU0ZacnNf4s4uSsiYmxE_vJhS4jO0GA@mail.gmail.com>
Subject: [PATCH wireless] wifi: mac80211: parse wrapper TPE elements without
 an extension offset
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch
wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
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
@@ -698,8 +698,8 @@ _ieee802_11_parse_elems_full(struct
ieee80211_elems_parse_params *params,
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

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0
