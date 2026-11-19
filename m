Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080937;
	b=DNEpL2msOsg1d34YBTM7qN/lFRsZctyAbelpZgmqbQhKCFScui1oGu+6/ja322wS8zIF
	 6xCR2kSaI4MHFPX87SHRuIil1Y0RHLC1xuo2plR1iAT0whhyplqPZ+K7Az1CpNIVibnxk
	 OGccQeTPNLSECuOJOpzK2ANx/wjWo+4dM+qCKOGGcJxck+rTOHgbI2VU2N5qvu7+K5sUg
	 4DLkN2GGcsd5jM7+1cYWXx+gubNPJDoNxgFmloCBUtxlPxEzSiqdHSFGwMTF2JBWfGc4Z
	 hEWhe/Zp1tC+xfy/U7PODytM1I+jAf8bOM8J8UxlRkJWJsPkriLYzn2wIX/2ByUzdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080937;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+vyuFtZZY82piBVNfH5j8rx0gFBhiL1nUBtOUXY/BpM=;
	b=iqnyrrG3c535eGaKr1UX0TpxreeZ3cXGyHMkE8YYCVJ7WN/oL2Iu3FgcD5WFHj78ByW+
	 4cNw35PiqmQUSdh4Em+jfiJLoMTI7lWb3HcsqFGxB1dMq0XJG61o19mdVMk5fSKKrRgr/
	 A4A9xSeLXFOQI1GazwZHBAlvTnNOuNiEciVgsTcQFy2a64AAvRYCQvX++hzPKWsP4BySn
	 rWrXKxdDqekeVM/QIQJuF5pE8QLolosTEBkIUImz8JGBCsO8GKTbjGsa8fr0wWW0YhdGj
	 3oZ7Jiwn2Z9m4ndJVQUFkOobjIaOUDyqyAUzL85YeTyOKYJBBtFgRd/G9ngPg4QOozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=Q0cvf+Am;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C09606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C09606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=Q0cvf+Am
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1795080929; x=1795340129;
	bh=+vyuFtZZY82piBVNfH5j8rx0gFBhiL1nUBtOUXY/BpM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Q0cvf+Am4NaPgrtTMYdOe7xKYf1Bzy6U3yeBfP7mmo5VgE/OOUe5k0xr4A8ZBeydt
	 bHGgUIvrJ8xszUz8nGwp4nif1863OWfF3NydKygNOXKkuMgHnKkTVFeGiGZfzUvUIa
	 sOhwgsfdLIRNzWXKj0FoU8pCKIdwgbUt6Dzsw54F12cTndyNRDBveSPfaI5/EPYn23
	 g0BKR7VTV4F6rJiI3f/Y7xaPAwfSsxhdcsGcHfRw50e5VSgBudNiPtmFvDm9X/lp3l
	 m2ibMvcxJOXnB6OJNg4pIFbhLexxu682lqX/SVU5Hl4JgBINo7cU893ZgBDLtEZsoe
	 QPJ4lA8Kqb3/Q==
Date: Thu, 19 Nov 2026 09:35:25 +0000
To: Christian Lamparter <chunkeey@googlemail.com>, "John W. Linville" <linville@tuxdriver.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: Alexandre Becholey <alex@becholey.ch>, stable@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: carl9170: take the URB reference before queueing the TX frame
Message-ID: <20261119093511.558151-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 9cf7b70c87a101fc6fb649e362f16d52d3b8ebd9
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

carl9170_tx() puts a frame on ar->tx_status[] while it holds only its
initial reference and takes the reference for the URB afterwards. A TX
status for the frame's cookie that is processed on another CPU in
between drops the only reference, and mac80211 frees the frame. The
driver then increments the dead refcount and submits the freed skb as
URB buffer and context.

A device can hit this window by reporting TX status for the small,
predictable cookies while the host transmits, which gives a KASAN
slab-use-after-free in carl9170_usb_tx() and carl9170_tx_callback().

Take the reference before the frame is queued, as the driver did
before commit caf1eae20668 ("carl9170: improve unicast PS buffering").

The bug was found, and the reproducer and this fix were written, by AI
agents (Claude Mythos and Claude Opus models). The analysis and the
patch were reviewed by a human.

Fixes: caf1eae20668 ("carl9170: improve unicast PS buffering")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Becholey <alex@becholey.ch>
---
An emulated AR9170 that answers TX status for cookies 1..4 while the
host sends traffic (an unprivileged UDP socket is enough) triggers
"refcount_t: addition on 0" and KASAN use-after-free on v7.3.1 and
"kernel BUG at lib/refcount.c:34" on master 666539eecdf4. With the fix:
no report in 68 patched trigger boots (9 on xHCI, 9 on master); traffic
with a well-behaved device (also HT/A-MPDU) is unchanged.
Reproducer available on request.
Applies to master 4405c18c95d2 (tx.c unchanged since the tests).
 drivers/net/wireless/ath/carl9170/tx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)


diff --git a/drivers/net/wireless/ath/carl9170/tx.c b/drivers/net/wireless/=
ath/carl9170/tx.c
index 06aaf281655b..46d8bc6647e3 100644
--- a/drivers/net/wireless/ath/carl9170/tx.c
+++ b/drivers/net/wireless/ath/carl9170/tx.c
@@ -1364,13 +1364,6 @@ static void carl9170_tx(struct ar9170 *ar)
=20
 =09=09=09atomic_inc(&ar->tx_total_pending);
=20
-=09=09=09q =3D __carl9170_get_queue(ar, i);
-=09=09=09/*
-=09=09=09 * NB: tx_status[i] vs. tx_status[q],
-=09=09=09 * TODO: Move into pick_skb or alloc_dev_space.
-=09=09=09 */
-=09=09=09skb_queue_tail(&ar->tx_status[q], skb);
-
 =09=09=09/*
 =09=09=09 * increase ref count to "2".
 =09=09=09 * Ref counting is the easiest way to solve the
@@ -1378,9 +1371,18 @@ static void carl9170_tx(struct ar9170 *ar)
 =09=09=09 *=09carl9170_tx_callback
 =09=09=09 * and wlan tx status functions:
 =09=09=09 *=09carl9170_tx_status/janitor.
+=09=09=09 * It must be taken before the frame is queued on
+=09=09=09 * tx_status[], where the status path can find it.
 =09=09=09 */
 =09=09=09carl9170_tx_get_skb(skb);
=20
+=09=09=09q =3D __carl9170_get_queue(ar, i);
+=09=09=09/*
+=09=09=09 * NB: tx_status[i] vs. tx_status[q],
+=09=09=09 * TODO: Move into pick_skb or alloc_dev_space.
+=09=09=09 */
+=09=09=09skb_queue_tail(&ar->tx_status[q], skb);
+
 =09=09=09carl9170_usb_tx(ar, skb);
 =09=09=09schedule_garbagecollector =3D true;
 =09=09}
--=20
2.53.0


