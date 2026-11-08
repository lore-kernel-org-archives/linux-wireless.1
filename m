Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175064;
	b=lZjT1g6tdxZvdq8xMVfTcTnMo+j4HHVBrvjAnM2XlMXRd6nBsScLY3i4ySGwlCv8xPwU
	 PEbvF6jN98NyoQyLHmJnsMWgvBwQoJ61htKrahzuRs17vfmt7324lj8hSiN0BBSkquvDq
	 +4Z/RKEtkNOJwaFJYknzco/3+jX18PdrwRa7QPbGtkHVQvB9hQMNoi3PBqTnaddUjKk4R
	 KM89nrTzSSX4Qr3crE/ARhpcSjMGOvokXuwwpvgGXU9NQulkfMlcEUdrKgeu3cZWEe1FL
	 VNaC2nASLXK8eI358mFSaNKc05aSkRTiSSR+jUXk9WrgcQsMAJiCN9cRvY6HVbjocnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175064;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ia18UYtnWBdapIgN7aPkviiAshzghaVd7+6TEQ0f1ss=;
	b=bnK0EzEsliECXx+ZVkPaK6ns+QFiEpKlXsw1ZTKZ1pDBldKZVZiVg3ldmT38xW45j1wj
	 OhmBuPP4gx4qPsQrKQZJnPpo1l0HryMhCKnpQ8PsfGarmcNBM8WAcSjEDIAai8lE14Yfv
	 Ktootv2weL3gma+/PR2E7ZujMXSBt5H6gGGMtUAT1ExVjNpFI43UBWnb2iVmhPnl1Kn4o
	 7kpJwwesdawcxLzpB8+fWYpq/BZGCgoI0c/C2F94vJcfpbcyTAF0ImRhHRUlnaRGc4+8D
	 o74nqxXWzTEdEgzxEBEwTzAO4KnyBosAMX0XScxtDLBgq//lEmyGUWnfC8R8ggROmIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WONgqkHE;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34004606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34004606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WONgqkHE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794175062; x=1794434262;
	bh=Ia18UYtnWBdapIgN7aPkviiAshzghaVd7+6TEQ0f1ss=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WONgqkHEaAhNoq9cphyKabziO3OlCTKgRiWHiCoDyJ87lbze/DjrvE129akVtX//Z
	 CQdtRRFR8+z7fjkZet3C1xHZf8jOPPMGUQD4MAayIiGTUTJhyDz282E/RX/A+n6kYY
	 tAbZ8Pa2F9oHnH+IrYgeOsw1e50CjjmhiwYTOjm+hcziYJYsgPNRUHJjw4UvlLoXRK
	 hu8JLR0CffTkes6TIWko+qUn0Df+bjPrL1zY8iUyQs0ADbhF0hCyo+cy4JIIPdb9rg
	 vT2dDtf6JEhFeUoMm07GQk5w/+ndef8HM+I1l2TWhtiq7u27Uo2mSR8eL74hPxrHYJ
	 DgOT7oyU3MLaQ==
Date: Sun, 08 Nov 2026 21:57:39 +0000
To: "johannes@sipsolutions.net" <johannes@sipsolutions.net>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "security@kernel.org" <security@kernel.org>
Subject: [PATCH] wifi: nl80211: clear wdev before erroring out of station dump
Message-ID: <ltwfLZuSH-PEFdqMECEU8rHwZCjSL5--7RG-qrW8a-Fwezdgpb1QYiDm-8aCRNIgwY-laqSmHJWAqV4uI092NLEudhWEABdd3B5iGsV4jJ8=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 5eb0af483ff3e980d0fda2c37c59a9658e0c80cb
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

In nl80211_dump_station(), the new -EAGAIN retry path calls
__nl80211_lock_held_wdev(), which drops the reference we hold and then
re-looks up the wdev under the wiphy mutex. If the wdev is being
removed, that lookup returns ERR_PTR(-ENODEV).

The IS_ERR branch jumps to out_err with 'wdev' still set to the error
pointer, and out_err then does:

    else if (wdev)
            wdev_put(wdev);

i.e. wdev_put() is called on ERR_PTR(-ENODEV), dereferencing an
unmapped kernel address (~0xd). The station dump requires no
capabilities, so any local user can reach the trigger while a
concurrent interface removal (admin action or unplug) closes the race.
The result is a kernel oops in the dumping task, or a full panic with
panic_on_oops.

The sibling handlers nl80211_get_station() and nl80211_tx_mgmt() never
put the error pointer; the dump path is the only one that does. Clear
wdev before jumping to the error label.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/wireless/nl80211.c:9023-9035 (EAGAIN path), nl8=
0211.c:296-306 (__nl80211_lock_held_wdev), nl80211.c:9133-9137 (out_err).
Introduced in the v7.4 merge window (unlocked station-dump rework).

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Fixes: [fill in before sending - on a full clone run:
  git log -S '__nl80211_lock_held_wdev' --oneline -- net/wireless/nl80211.c=
]
Reported-by: [your name and email]
---
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e20..7392834 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -9031,6 +9031,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 =09=09=09=09=09=09=09=09wdev);
 =09=09=09=09if (IS_ERR(wdev)) {
 =09=09=09=09=09err =3D PTR_ERR(wdev);
+=09=09=09=09=09wdev =3D NULL;
 =09=09=09=09=09goto out_err;
 =09=09=09=09}

