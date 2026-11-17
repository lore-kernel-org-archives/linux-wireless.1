Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929519;
	b=raSQzo4J9MPgOeO6biyhh0EtNq6eScR71gyE55OuWgU41iVDC4GYfmsQ+ZhZYlMwg67L
	 yXMwqV8IkWaEs+VnTzVI/GB9DpXr1o+Z7QlM16DSJSXSnfzfJwKwuPPywsxXaGOxlAEbF
	 +VMp1furFAkzeaGQQJG3zFnWYdZ7+mQuDp7JsivJgMLFvzeoQAFLoX3PvcrSMZmWPEgvm
	 IycS8GT/Cj1TZGwJpw4QxjriRHgS44oVCPDWcmtGzZBFLRzgpgsDZaMpX4AM14AU2A3he
	 Z+AnYMs+QJnux9WZGEX3OyJ0eldy7e+Y9/XEuSTjMpHElNMRAgVv7XcPUNwNtgMXf6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
	b=5tkcW+7J9NoPB4JSb09yhTgkNQVZIY/pORwrsz+Vtlqz2DnxRk0THYw7RItLbkrazteK
	 /f2LU5zWaA6ubhmSM3WQedgJm2LyKn9+3TFIvM2EbYaGISTVP0FCrfZyxV2fW2izv58iK
	 IiQ9ej0zCE7mfbuuBDpZOcVLD3JBnM2d3SK69/2qUDTQ41IyyaBzS/ll6dS9LAqN3u6b1
	 9Qsd//0dPoSzGVIzX7cn+91VKBwOgtmUbJZYT/0YNNzaAXISJ+cxtSw5jcjwdceqq4PQR
	 Iy1N5FE+Gs+qesF+rxDptjk4pfAYrj4bB/HfkGapZ+ujUTic9QJE+Qb2ArQn6dfB+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KupwTv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5C606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE5C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KupwTv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so22925855e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929517; x=1795534317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
        b=E6KupwTvzsWbDQglrtCzkz2hEiZS6xYQmGS4ej2OMJ/E2fHpI7relGGtZol+S1zFyW
         s2zu2pb01GUffSrLOa4c9GImtVfOoLyqMS0um7+kwcTT7AK5+L8gKFKI9W6LwXT92fbM
         KcFftctLAbncEplU/RmndFznVX7QOhfW8e45aM7DWIk0m3Cyf+Gj/CC+gVAFf+s1+gCN
         deMtflBaiidXkiB3IDhdYX37jxmZczazhBf5WB/OZbz40KicPsNCRh22a5NABZglsPgf
         OBdPjBNhYU8T0KdjsYYQLqQGua0Wvdkx+uaIOL34d7BHUetSimR2ls3mj4kvOmIkJoob
         o0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929517; x=1795534317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cej5FlH9mXCndJQNACqKxUUko/pM9TqHH5ko3G8yZl0=;
        b=cEjtWoyqjxsVWOOuZs1aUWOPvm9gtAjlWeFUJMbN8Xz2VyEl7XCLPiiYVA7EXYTf1r
         xKKy3p1FJ19mlypHJKFSJY+lEHmq7VbDro4HTNpPhvGoWjnW6lv7oq8QEUygjq3eBNRM
         Zyz0PhPnm3lZK5XMUmliK+0vRv+3SuUkSBh30aTevBofVALGecZNS/uelnpGeHsHwIPg
         Zavb+UyjHrGlSBEtS3VznOy9oMZyXFW9FYXcO1rgHATNqcHnaSLB0d76XBI5jBxpIQwL
         md2wRpdVDzmPFnOX5qEnAZGexAzpk+NltjH5wiCQRN91lT8+2qOvnRERAaWS+XXJArdV
         LoIw==
X-Forwarded-Encrypted: i=1; AL+hErGMspJrnXvVLraNgxS1dDwNDi3rWwcjfAwAf1bEYjPWsiQ4qke4YzkOiwfOBS1pI2NlXTHi+baZK/5eapsNZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NjUH4LPFqmKypLG0u8x1tdYLGzb7dlj4N3JDvkQTnkWL/z9Wx
	Xqin8Y74fQ+a9YyVSifbWRmgzBKDnfyCGUdIPblCAJZmbI0qioFZLKWb
X-Gm-Gg: AYBFou0ZtCdQxbFuwtbV2ThJ+Rq4BCMz0UzaVRnuSGBS7nEOVy8oFk+1UHbuZaVkKM4
	UwxqDjbmyyKZnKtRSJ9pigodUpYiQGtim7c6wHWsrM11b6kaf9NUMTnlZ3CYUV7/BBP448NpQvX
	lt1ImJzeEw/HcSmblze22u+1pAzTpMQJ+cAGA8qO2Va8/fWjrNrrOsze3MAThemAzonN+GMLdcB
	mTy0OmvL+z8k4/VO9qJSMgzL8ZIh3m9uR4e6jSAwTt04qY0Rsah6y3DU34XPTztXKFHBMz+S2ou
	yCz8hJGJ7U85mo1HNSeMqWUd1bPT7yaKsknhltafLt22EkqmppGbPGUFgoNKpeACCoEwK0HfmQp
	DnZ2Spf87mBp1mcj0k+2E1i1MhFvDD5U2jWnh722gaXDf7Ge1V7iFuD+GKkpFPuKa0Zs4wD48jF
	jA8l97wjanoXIBSsgNLKK4TQA7EYmgx61Pvv3IkZaB3QVbNCsBWrw4S4pUW3k81Z7H0Y9Lk/wwY
	X/tGEatOs2E07ZkByHNFHrqjdlgClEdR9e/nK/E6yZGXM3EVxkRbYasUMmA7t+/wRXMoJGcgAJC
	/dF+F11h9yUKpIR2/qNBcrjXu+x7ogrH9yI=
X-Received: by 2002:a05:600c:4f12:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb65edbbcemr225699605e9.33.1794929516791;
        Tue, 17 Nov 2026 07:31:56 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm108960895e9.10.2026.11.17.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:31:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH wireless-next] wifi: mac80211: replace the CSA beacon before clearing csa_active
Date: Tue, 17 Nov 2026 16:31:54 +0100
Message-ID: <20261117153154.1804945-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

__ieee80211_csa_finalize() clears csa_active and only then replaces the
CSA beacon with the one for after the switch. A driver that fetches its
beacons with ieee80211_beacon_get() and skips them once the countdown
is complete, as ath9k does in ath9k_csa_is_finished(), tests csa_active
first. A beacon fetched between the two steps passes that test and gets
the CSA beacon again, which goes out on the new channel, and
ieee80211_beacon_get() reports "beacon TX faster than countdown".

Replace the beacon first, as the finalize work did before the clear was
moved ahead of it. csa_active is still cleared when replacing the
beacon fails.

Fixes: e487eaeb076a ("cfg80211/mac80211/ath6kl: acquire wdev lock outside ch_switch_notify")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on rtw-next on an i.MX8MP board with an AR9271 as AP, ath9k_htc
    with "wifi: ath9k_htc: do not fetch the beacon of a finished countdown"
    v2 (link below), hostapd switching between channel 1 and 6, one sniffer
    on each channel counting CSA beacons heard on the new channel. Before:
    3 in 200 switches with a count of 5, and a print in the driver showed 3
    fetches between the two steps. After: none in 200 switches with a count
    of 5 and 80 with a count of 2. With v1 of that driver patch,
    back-to-back switches and AP stops in and out of a countdown gave no
    warning from mac80211. The rtw88 AP channel switch under review
    (RTL8822BU, RTL8822CE) counts down on the air as before.
    
    https://lore.kernel.org/r/20261117151703.1802556-1-mehmet.fide@gmail.com/

 net/mac80211/cfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9e47360ee8f5..9458838bfe63 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4776,9 +4776,8 @@ static int __ieee80211_csa_finalize(struct ieee80211_link_data *link_data)
 					&link_data->csa.chanreq.oper))
 		return -EINVAL;
 
-	link_conf->csa_active = false;
-
 	err = ieee80211_set_after_csa_beacon(link_data, &changed);
+	link_conf->csa_active = false;
 	if (err)
 		return err;
 

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

