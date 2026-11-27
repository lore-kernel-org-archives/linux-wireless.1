Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795817124;
	b=aPBZU1DBVXE1rCzqtQF7bqXjYaZJvO6bKedwt7GA/KR+sBpycXg2Rk2nNtW3H/MCcYwn
	 ILXiLsdO6/BraPCiyhT+7S74fw3Kx86G7Va18/pPCxYVSoQKuCGgHIBYuyH1IzUO5vVs+
	 lIZ2VivSXR3N1kPSgfWWrT/B2E3ETnodRTMoo9IHdt1cfZZpYwHjq0s6bkejcJhfR98xd
	 hSnUpH+RNGQnzq/Pz5CXWocAsD0U/+WhA/aM6+5UVVVv9JgGQb3RQTv6tY7r4DVwmDcLh
	 f/gX4tJA6ssnNlmFYXnJKHGggrHsRKFNu8vCOAW+RlR9tluAL22F0uL0OLKQB6m8Obg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=htEaTAPv31EHi8WA+sGARlmFQNm132+r4acoha65tKY=;
	b=Pnkg5CcAjY1MC3xyey3QsEAs0Qh3KG8qBatr3sz2JTWgzexVQUteZkPq7OktpN0fdlyG
	 yIOPhHOk0NFOiz6Y5W161jq8XJeDsOi7OvL3s274jUNF+yJXO7uSdhQppF4UWpMKrhtkX
	 PvMvdc6/wFtDTid1jKKF/EoF6b6MtZbfGPNapBUafVQ6vQrN3xCwSmdyueWXjZNjDvea8
	 fl+HTT5EdJsqPceVtFH9xYBUDAdtz15ApTYHde3X5HaNjtV5J9MdXt0IjbbPXBPa78SJh
	 lX9CSVr/9nn73V/uY89ZM1vavtCkr2yApHxmATAeXQDGl9a5YH64bbc6N4OARkeOhgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnv+rqnr;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F6E606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 22:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnv+rqnr
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ee2ad94713so5327455e0c.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795817123; x=1796421923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htEaTAPv31EHi8WA+sGARlmFQNm132+r4acoha65tKY=;
        b=vnv+rqnrj3rLjQNZNNmOndQb6SKtorFMXEbFgArx3fFELVt5TIbNNBTyNzlRC5JHSC
         Pu/bN9o2zUuUKAH8mABvrIPI4amoLqczXB3uES/uX5AwOKDC7rxk0/nAxEDp85LL1aHI
         CLBWaorPxpgKEG7KEHUL2RFxxr2uamZi89vP9dTyKzC4YtcyaZ4TW/n4ip00b5obh3m4
         Qfn1Eg36fXff+CDknclBidDf/6FtGJDsXkSZB3berDvLq+24pZCGDKNEL+K1SV1irOjF
         bByW1MWSYD56nJm44cxeDOZGpn6fCDRZSIQEAXYtS1OIWwGyVxdvJeATIecHV2G3Kfal
         JKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817123; x=1796421923;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htEaTAPv31EHi8WA+sGARlmFQNm132+r4acoha65tKY=;
        b=BUbyccCebcoxhZf2KNZ7ctUYH0PnoP8Pz7TvjDSiM+TCrxpcK6SuXJfaavBTl+rKdg
         kpfVHWufL4BalgrUnvaBDRWoi/oOkgcxQDeht1GBruFFHu7VjUe5f4owr99DqJAkulYr
         YruvDfztxOJG7jkDEHfSmeMXGzhlPuA/0JVjXr0KUYl+pJojaaoXBYqHT6EgNBGHyKuf
         GgIvvzq2zRqPCP89aSx+E6suyTwdTrcAzA+YjLbqJm6ISRV1amRhzgoh9n9KAMbCfjNt
         ldGpdd2ImL6KHCEm6wW5JlRlDeHF83NM07z/XHdYnx89SqctTlsxA6dQJl2TWxjFjvrP
         /riA==
X-Gm-Message-State: APuU4Z/hJJsWOjbKyGkSiPl8+70mOJDK+okvZU5gBYHme0TkPdPOx9Hm
	/JGaHoeuqwMjB6vOXe1hAKliCDigw28ydAywJ0pWRPf5v5OuOHV+Tqnk
X-Gm-Gg: AZFdTZedttpZ0NDQTsrytZSXAwuEqRj+lmoIqk0QonD+a56ZCL+YXbN+bBpDFWGyVKa
	Y6GFM3y/fIj6iqzbu6XkBi8gQEsGjV83vXCQLSpADu+k6Ttw/hIUmJ4GFkHsMM5y2tRXGKlN+U8
	zLo8JZrf/9Apy0pXIEUGLy0BZBetARYNAiN2Ay25BM4kXP193/YW1lCGv8xLhOUJe2/R5Op+T5q
	iVbmXHL2tFieBToDyL30ySAJ9Q9MQX3QJD3wWVnbxLURtcwesEkHCVzBmSmBcb8ZRUq3dtQhtyi
	yCSTpz34KhCcQz9r2Tv7Am2uxGWIex+9x0vLydN7jnH8on4RHoH4rTKaq6KuA2/QHgKzWZ/bZG/
	q1hGBPUEbO0OjoGs0Ci+iA4RYVj1J7pt8ch70dvHUSBhluG3PnIhz0vF2w5cP+pkfBQfzA4+890
	2n/Z3sSkPhRc2ueIMOxRiRXMQ/xOkMpDoZ8lGCmHaOS5YtvvJ2QllhDVST/zMSF5dcKTbGUjRQ5
	ZIMMT4MfdMucDhxrWP/BJbBtzaTrNL9grI18V8y641n9yNdj32GZAj4InL6vU9Pq539zPbeYSRY
	pCdyh6aa5O82MZaENz1AESoi3aiA9Vwc2mPEbwyDaqIm2Fb8voVuRY6nAW3HmM8aoSiUZu4cm2D
	yW6yAOBjjFkbxPJ1spg==
X-Received: by 2002:a05:6122:3121:b0:5de:ee96:75b with SMTP id 71dfb90a1353d-5ee8af4ca69mr17591927e0c.12.1795817122797;
        Fri, 27 Nov 2026 14:05:22 -0800 (PST)
Received: from tuxmobile.lan ([181.230.232.62])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec7cb5sm26862230241.2.2026.11.27.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:05:22 -0800 (PST)
From: Gaston Guevara <guevara.gaston@gmail.com>
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org,
	Gaston Guevara <guevara.gaston@gmail.com>
Subject: [PATCH ath-next v2] wifi: ath9k: don't check CSA completion on station interfaces
Date: Fri, 27 Nov 2026 19:03:25 -0300
Message-Id: <20261127220325.8666-1-guevara.gaston@gmail.com>
X-Mailer: git-send-email 2.39.5
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

ath9k_csa_update() iterates over all active interfaces and calls
ath9k_csa_is_finished() for each of them. mac80211 also sets
bss_conf.csa_active on a station interface while it follows a channel
switch announced by its AP, so when an AP and a station share an ath9k
radio, ath9k_csa_is_finished() calls ieee80211_beacon_cntdwn_is_complete()
for the station vif. That function only handles AP, ad-hoc and mesh
interfaces and hits WARN_ON(1) for any other type, producing a burst of
warnings on upstream channel switches (about one every 200 ms in my
logs).

Skip station interfaces in the iterator callback,
ath9k_csa_update_vif(). A station legitimately reaches
ath9k_csa_is_finished() only through ath9k_csa_update(). Leave
ath9k_csa_is_finished() unchanged, so that the WARN_ON still reports a
wrong interface type arriving through its direct caller,
ath9k_beacon_tasklet(). A P2P client is NL80211_IFTYPE_STATION in
mac80211, so it is covered too. Ad-hoc and mesh interfaces keep their
current behaviour.

Fixes: 4effc6fda7ab ("ath9k: prepare for multi-interface CSA support")
Suggested-by: Toke Høiland-Jørgensen <toke@toke.dk>
Link: https://lore.kernel.org/linux-wireless/CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com/
Signed-off-by: Gaston Guevara <guevara.gaston@gmail.com>
---
v2: move the station check to the caller, ath9k_csa_update_vif(), so that
    ath9k_csa_is_finished() keeps warning on the direct path (Toke)
v1: https://lore.kernel.org/linux-wireless/20261123210815.25770-1-guevara.gaston@gmail.com/

Testing: v2 was build-tested on ath-next
(drivers/net/wireless/ath/ath9k/, MIPS, W=1, no warnings from the driver
sources) and run on a TP-Link Archer C60 v3 with an AP and a station on
the same radio, running OpenWrt r38494 (kernel 6.18.64). The hardware
test did not use ath-next: ath9k.ko was built out of tree with OpenWrt's
r38511 SDK (backports 7.2, with OpenWrt's other ath9k patches) and
loaded in place of the stock module. The mac80211.ko from that SDK build
is byte-identical to the one on the router.

With v2 loaded, from 26 to 27 November (about 22 hours), the station
followed 14 upstream channel switches. The AP logged AP-CSA-FINISHED
after all 14, with no WARNING and no reboot. The station lost beacons
and reconnected once, more than 4 minutes away from any channel switch;
I did not investigate it.

For comparison, v1 run the same way gave no WARNING over the 12 channel
switches quoted in v1 and a further 57 logged between 22 and 26
November. The only other direct caller, ath9k_beacon_tasklet(), takes
its vif from sc->beacon.bslot[], and only interfaces accepted by
ath9k_uses_beacons() get a slot.

For information only, not a claim about this patch: on 26 November the
router rebooted at about 06:05 with the v1 module loaded, 48 minutes
after the last logged channel switch, which had completed. The cause is
unknown. It then ran the stock module, and all of the next 10 upstream
channel switches logged this WARNING. 6 of them completed
(AP-CSA-FINISHED). The other 4 never logged AP-CSA-FINISHED and ended in
a reboot. No Oops or panic reached the remote syslog, so the cause is
unknown. The two periods were not randomized and the modules come from
different builds, so I can't say the reboots are caused by this path or
that the patch prevents them.

Tool use: an AI assistant (Claude) helped to locate the cause using the
router logs and the ath9k and mac80211 sources, and to prepare the code
change, the changelog and these notes. It also ran the build, checkpatch
and log checks mentioned here, and, with my approval, the commands that
loaded the test module. The placement of the check in v2 follows Toke's
review.

 drivers/net/wireless/ath/ath9k/beacon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/beacon.c b/drivers/net/wireless/ath/ath9k/beacon.c
index 4a27e3753c03..061e96e3d4c1 100644
--- a/drivers/net/wireless/ath/ath9k/beacon.c
+++ b/drivers/net/wireless/ath/ath9k/beacon.c
@@ -375,6 +375,10 @@ bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *vif)
 static void ath9k_csa_update_vif(void *data, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct ath_softc *sc = data;
+
+	if (vif->type == NL80211_IFTYPE_STATION)
+		return;
+
 	ath9k_csa_is_finished(sc, vif);
 }
 
-- 
2.39.5

