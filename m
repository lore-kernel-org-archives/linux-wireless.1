Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468137;
	b=iRoULnEl543HJ4Mw2iMSw/UYCk1qnKnHN4JcSh97FAijtHebEcnnIQHKCwD4COla7Haq
	 85Atc5bj3+MivvQmdHOOTYEHH+RiJGZHpIsCYyX7A459vHp3JJ3oNuayji6tjcgNUg3aw
	 rA4vPs/Mb6jGadHU3Noco5Sc2wMrhsOyyV0YWZg2h33Is5HZlHaMuighTVJecVeXHtjpg
	 l8ziiISpQ9oq3AFTVMQvB2+pbYnUmTjp8mOukTPuCHnvVFHyOdrc9BqoHx/lEhgTMLkYq
	 CJNkCtjpvyG/GiIbqt80Fy0vhbNLT+adS+eUXYQXIYTigAZGubgwnOnzFJ9kCIJMB1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f2NG2KJ42BFW151H0tBsjv0FAQmpfGgM1WHrS6CgImI=;
	b=bJC9k+Pr/7uMjgZ/etjDhp+B5WdTjJSo/ryiXaKKqIzvoeN+xTSOq3G6oT2g3Q6OEJSc
	 qViGVLIv7JSC37BiesbTNHXcJmIUMN0lT5pn494Kz70N047HSLTZHgo/weYuMiF+Vizgm
	 G8CoINXQy5R6IEnJZetvKM+1/IMo0h9PALM8+o82cmi7BlY2dgnjwivl2Ws43zfepPmeh
	 zHh1CPua0oPkeVnewzfLhp3OR3FCo1c/XDtfY9IbWbHBdCSi18NKKoKgq4Y2FZzK06tqm
	 +6Hf34WbpLTyh5BywH41I/nh0avruiNMxgwcwBmcx+cyE+78a4Vs+iBxOi91GvTVuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI5kZU0;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA2606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 21:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI5kZU0
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eadef147ffso3037388e0c.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468136; x=1796072936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2NG2KJ42BFW151H0tBsjv0FAQmpfGgM1WHrS6CgImI=;
        b=oiI5kZU0M/CSCMWIUjZyRof20DyKoyF5/VR/yYWVQme9mZI8H3Z0CAAuC6VSAs0mhu
         Vz4/3TIQkcvrx50KP4OaWCty4OmoP7zYQzgLCz8spTS0R8VoqkzgL7pGuz9UKt0tD2Co
         6APcqnKSewL1hDgGMV+p8m8UBq1n9wSdMDHdNuq77JKj7ZX6HKX1jKwjJWtRlmISdZmb
         iGuKEJy+QKR57O8NsMkEiFKvbCKL+lz2qrNwAcdX2di9WLDbLTf8EYRiEVGHbt/93xni
         HkNCQhChoG5tqIkAmPbgmqvm2akFH7oSTDdDcDLJv2blMXVusccK2RGQFz05V0SLpzZy
         6SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468136; x=1796072936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2NG2KJ42BFW151H0tBsjv0FAQmpfGgM1WHrS6CgImI=;
        b=jSHrXkDdO1+0zyTWq3bkKQ0fIYSgx2RdZ6aZQeJv7PA5GzYhu3h5z5eZBjET3nuZ8G
         KtOyX1FzZR7o60aLwK+RaSST5DLofUfbrMMmVwqj0x4v66TrBD+P07HlOhnF/nRHM45n
         6PoCLw3fWAP34KDR7SCVk94Shv+kNMyB3wYpKdAQy6DpSLzuhvmbUt5qa7KTfqWeAuY8
         x7q9Iu4xkXcvRDnkYjR4cide7cmeCuVXWVNR8z23sWjJGPlB+gm13oCKvBljME6SWYUy
         09flOj3SbxcskLtUP1JIATYwgE9YswErkrcPBwTnF6ICkFLnXi0yu3kFzQPatewa+b01
         FZ2w==
X-Forwarded-Encrypted: i=1; AL+hErHwkRP/xNbYzfD7fPGRVt8+24VWX74BOruoh9Z1RakEbkCYNp6CveT7/KMy+QZc4jxGrpNMmUOc9WEPzAclrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8lmOgNdq2rM6LsPhSa4lIp7eHSTxtfqMGjjb6pH8zYEtbqAdA
	nrE6jUWKoT8KjTEcV///ZV8OgVWyRzzipHb605bf54vlACGec1gAblM0
X-Gm-Gg: AZFdTZfU9N/qKqRwBGUFGCfFceHcjtdjL61KEPGzWBLodhVzperU6ct+x4ND8zQ+yas
	usYZnQ3hIkQnVjhPi80fAoNVAbGHzASbJq9PFWOj4FedgRy/dz5BOfZ1drnm+z2z502J6BkU2P0
	jiuIYe6KB89csbLIEaHf7xzaaJ29zQ2DY2mVClsOPcPLw+LcVIUhcTPjTtO4E7XdibADpfreQEN
	4mLgbM3cc6bgxxpp0yPsgjH2uMIq7PAmOcjj78LvAFdlmGUie2gMcKErG8nTHwV7/EkjvH19mdl
	Zj5vuu0LpyjOxLIq6UyGf5TkSIYu5Bg7jR4tEw6nQmlE2/pLRcyjuMUBpPv8oq+hmCLYiZyhQu5
	OASm5yHiItrn/OCNrjkofT2nx/hxfd/rMQp2Y/rRMQ9b5imYdgL6NFWwhTUsw27kBdaiuS5BEMn
	itEqBiEgFTFJomnV3w8S6Ia5gA91MKFw0t7tD2ChoGBIySJ3dllabAlXvt4AP/XKpsauyYOb8Gd
	6NLMmL23zVySuV7JkcYFfC60qZd9nz9hReVUc+fNtF80mXWeA+E0O9zKy9dX8BldCXZXvPvYiIH
	oAFCHNlY3o1Ttf5goLK8rFbf7mi+gU9z6nQBCDFpb3ebgzEFfPV7eq8IAcR5cOU68KXRlwAwqCt
	u9Utt5xPcsO16y2z4QQ==
X-Received: by 2002:a05:6122:62b1:b0:5ee:40e0:482d with SMTP id 71dfb90a1353d-5ee8adf0fd9mr6950729e0c.3.1795468135671;
        Mon, 23 Nov 2026 13:08:55 -0800 (PST)
Received: from tuxmobile.lan ([181.230.232.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555147sm11839376e0c.6.2026.11.23.13.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:08:55 -0800 (PST)
From: Gaston Guevara <guevara.gaston@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Gaston Guevara <guevara.gaston@gmail.com>
Subject: [PATCH ath-next] wifi: ath9k: don't check CSA completion on station interfaces
Date: Mon, 23 Nov 2026 18:08:15 -0300
Message-Id: <20261123210815.25770-1-guevara.gaston@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87mrqzeets.fsf@toke.dk>
References: <87mrqzeets.fsf@toke.dk>
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

ath9k_csa_update() iterates over all active interfaces and calls
ath9k_csa_is_finished() for each of them. mac80211 also sets
bss_conf.csa_active on a station interface while it follows a channel
switch announced by its AP, so when an AP and a station share an ath9k
radio, ath9k_csa_is_finished() calls ieee80211_beacon_cntdwn_is_complete()
for the station vif. That function only handles AP, ad-hoc and mesh
interfaces and hits WARN_ON(1) for any other type, producing a burst of
warnings (about one per beacon interval) on every upstream CSA.

Skip station interfaces in ath9k_csa_is_finished(). Ad-hoc and mesh
interfaces keep their current behaviour.

Tested on a TP-Link Archer C60 v3 (QCA9561) with an AP and a station
on the same radio: twelve consecutive upstream channel switches with
no warnings, whereas every logged switch produced them before.

Fixes: 4effc6fda7ab ("ath9k: prepare for multi-interface CSA support")
Link: https://lore.kernel.org/linux-wireless/CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com/
Signed-off-by: Gaston Guevara <guevara.gaston@gmail.com>
---
 drivers/net/wireless/ath/ath9k/beacon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/beacon.c b/drivers/net/wireless/ath/ath9k/beacon.c
index 4a27e3753c03..ff72f231be5d 100644
--- a/drivers/net/wireless/ath/ath9k/beacon.c
+++ b/drivers/net/wireless/ath/ath9k/beacon.c
@@ -362,7 +362,8 @@ static void ath9k_set_tsfadjust(struct ath_softc *sc,
 
 bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *vif)
 {
-	if (!vif || !vif->bss_conf.csa_active)
+	if (!vif || vif->type == NL80211_IFTYPE_STATION ||
+	    !vif->bss_conf.csa_active)
 		return false;
 
 	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0))
-- 
2.39.5

