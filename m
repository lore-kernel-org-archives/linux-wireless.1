Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794748470;
	b=r50MB3O/98K6FSxC5aD3y3jUTr4aQhOPTxWaSkRBvLjYD8UfnbJDta7cZAL/y2TLCq2p
	 kyevWf2nA8Q/Xwh5FFfwbb3caSZ4YetmpCqUg++k3wwAELU+WvFUdGQzubwLPGF3zIgeh
	 TO4JdM57CtUSPEX5J56S5wPu3ASALqPOKsY+TZ9SEGt+0O714SkX7GLdgfa3o/q4ljypj
	 j+NsCqCWjpZInDjTjgE5ynEBq4sn1DyzjMu7v7dErXy89k0St09+0b5YpaGYYRPgAu5YV
	 PCpKLcATjsRILWTYlBC0vjiWreke2YMxS9KQbmmxKWzDxN8h6qX7wwGl5IVALc7cpXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
	b=Kj2KH1qzKyhLiaBFgZDlCllWYzPWzeWKg/+c61hgDnx0Ky0QGTrqDwJJ8srNfyfEPLVx
	 D2/sa44K9L7HGTkpm3IGcPS8BpEwnx8fmg3fFDnOgs16piI7S7DNnHw4NKff8rhjPXfDU
	 iwWa0cCxYmPqOo6kfalL/DveHJwrzpPdL6Og+jHfA17Y/FR6qSUPpwwkr25QSI0FXd3sj
	 6ldPwYiWvof5LeTg56yASh/aAAENK9MEvlCXAMEaBQwiY736jyWrKEaL+nai02Fk2MO6r
	 Flt6EH/xzwLc7UZWO1U2Wfctua1DSVGCGED8eZDMb+FQXM9q0T5fUdkkkWGMUhfLeuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzS0tOez;
	arc=fail smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593A606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7593A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzS0tOez
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso80783241.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 05:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794748469; cv=none;
        d=google.com; s=arc-20260327;
        b=mIRQP4EG0PbA6jDdeLO7vN/eh46kva42JgY7PGgu5RONLkYggCvK2lWHsAZQ8Qiq8h
         l5cNMERS/vAMD6JFK1E+rVPXugyePWu7WqqMw69lHf28kO3yVMwEFOFDU6LP/gpaO8Ps
         DWxNJfkkmqp8gg+ZOZfrDTiaNna1UkwC/i2fE7h1Ia19FLM+WS5KjQZ9lxONeMh8sUcs
         PvV+dIi/k1QF59Z2KJh14LaVzNR/yUmHxTdaWb6cAf+aL1I9ma9LtZ5nvJnHoeT3LHw5
         mrgjkMEaO0yqHmh0DRWJjZZdvfHl/k2lAsl/2cl+3fcQy/Ujql7itBPMgZRrJ/2ekL/O
         n2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        fh=8IAy5qup0a2EY8QRGpBSpKR+Jn4fWjWAV5x6xozgXOQ=;
        b=btnXiUgHWWKHJXuIs46Dn9SZ2T4K4AedKznFeXWw3k6qh/PvwtripjMq2/jwYh2SMO
         Xl/kFpl7Z3JCcOgd3Q9r7klG07N09L6ESozvjnDIMtQyjVZ++BNgoZgJOeq0YgC5lhGn
         uR1pyeM9FZu7LCYCltTZq3lOI/2qlbJwx3sRep8EYLcJAJ2o6+KNpvjo2O1VmfaWaS3A
         Q3YFGp/9UCu88hIV/aeZ4q4VGJ2FAZZzMgn4gK1nLGzCpYsDAob+7Rv5Hb/dYmlz+EX5
         ftlo+bRu8B7AHqyRxfpCj/zZU0XnnBm/TBdSd1KnqSIDZ/h1Nr8vbgxGVjgQLpr8FlIa
         OyOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748469; x=1795353269; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        b=vzS0tOezwaJfJKM/ugPXfbwXZeMAuY8izOXYyvEuIr+NYPL9H2n0d27ZB7jGHKiemE
         YKIdO+a/tR/SjXqkPGjtg7XZe5j4zm9Nxa7LYI1GFtcrdsHOO49pcqQCS3MuYHgLCSvO
         CeOtmmVwOuG1jhHm9N2c69lHwt0kj7Fg05U45eGW5/jsXB25h1psxaRVstMqZilHxcRm
         GRY2Jvk7UXhOJWbDLF3P4CQP81jyeiR6RSG2R92xrHf8XitWJ6XnzpvakU5vina1SFvz
         QrGY/sGTtX98WMiQJ5RWQHRyKc18oGSTOBbiH1i2yIxZ3oXOWLvzvrmmWCEKd9ybawLG
         PQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748469; x=1795353269;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        b=oLm+7OMuD+zO5r0uVbEn65dvy5c9twA2Y79Cf+kun1Y3rO2dOyRib+KdNKkwqxIX58
         xJYdGPW1v5DS9iKXtSIUjci1DgHgTqkQuuCzsFT0QOjMCct13wcOJ0oaeJk3E104co32
         TyNH4Qq3GmEn2jZ1YsCbJkZdPZPQrgJ4KKTMyjqMFYNI6lPE4ly49LfJCn6J26zY+na3
         nsVtpEdGLVbYSkJbzOnQQoZYW+gbKRLQG05F8cRM5qQ/UYisCIRFHclUYaDys+HdX7ag
         cjlvShkQISfrsfFEgCUroBLHDHhGYh2LASQBF8jsSEUzrOFNuczbphlVCEd21CjMgck3
         htLw==
X-Gm-Message-State: APuU4Z8tY1eX0v9YE2rQQVMYH9GnHHbI6T2oIU35oDxg7YefE73826CX
	g5mkxB2Iy1mzHtR8dJBmMCOjKgkrB6MuYQH9jJY1rVKHV8h5e10/zVBHRgw/Zm8lCGJrgkX5Dcc
	DStQFUspR2D6ii4zmOzoBBWc6S99U3vo=
X-Gm-Gg: AYBFou2Roz4/+T8twlngSql3Y9hO3/zIVuesyeCgb9gzFRHA5MNP1+jbuwpu9xYVcM6
	wjjwmjlXuu+6o9TuXHezUO/QwK571In+1nTnx+EhaNS9Y+iiYOq1tmhMQho58LASzdPtryUO4jJ
	nIXVqriwzvIY9eYPq7FALHdjPdSmJ/UCvLMVpoEnsLHpC4S+WNk4/E/s6/A1wFH0EuCKeoWqg/W
	8CkrsM9AckbDgGpuo4lMpVQKp9YEZWpmcA2Apy5VrVcR1reD/TeTRVF7mHaQdPiWny6pWywVcNp
	81TsFG+5ngeUE55En3FYTnd+WlIfLdYbquHguMTK9W1pSi+8iSZSdxR+gdA4ew1RpH71Ygbiq2T
	G9Xc3o7Upivtua2gtDIKfvI7gkyUz90jd9ClofOBCpCeRTgH2ho6qp4w1vQ==
X-Received: by 2002:a05:6102:4412:b0:7c3:68c9:d24b with SMTP id
 ada2fe7eead31-7d64d767b54mr1875312137.17.1794748468894; Sun, 15 Nov 2026
 05:14:28 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 07:14:28 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 05:14:16 -0800
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
Date: Sun, 15 Nov 2026 07:14:28 -0600
X-Gm-Features: AclHuK--EdPjoiSIYzc81ErX-WgozmFnctLmEz0c5VmUm9mcp7XJG0KbBCaY5Mg
Message-ID: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
Subject: [PATCH wireless v2] wifi: mac80211: parse wrapper TPE elements
 without an extension offset
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch
wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Preserve the author name in the mail metadata; no code changes.

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
