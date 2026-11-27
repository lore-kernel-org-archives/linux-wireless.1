Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781141;
	b=SeN4B0JuVACEXhaK9QdtLYasPqOM5igQfKjfGJNsFX3XaG0OyjKpHa2td6uB9/fKvPHU
	 gkGsnsY8qmEzMWrdOqHm4YoEe/ShPp8o9/87CGwcCLavinsv5sASPTS+qO8WH3JAe94as
	 Lb5vN4+LpHg9yvKtBINIsZ92655rxl1YcbykO+wHWSi9IukFQ89cCtABJTOo7c3ulexKt
	 oTG74srMkeMj9HTsVYq663PO9Zy0ULbM+fx3LBwvfdu86tlpF7nxjoKJwTsWpikgfxlU/
	 Nqsqu7U1w/BPVZgctLOEeYkmPGxOaVQLnFjYsVMx7n+kyMMl53OZ5R6wdyVUubQTDOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=s3lhDYV+i2Vv97Wklqtcwj2VftWjhscjN/NoyT0MfjA=;
	b=mnD/0K1lp/oFVUrrgrkAArK4KqZXNinZx0dUOIJ2EEcNxZyRdCIpGNpf47+BZNpKOvlp
	 1MLOAxCr3wXJK79uLQ1rYP6hDXj5Xcyf32vIEz5+eqj+Ke++MrJyvTocEWvszoQ1PgZtT
	 PP+zz/DL0psrO0gtAfeo0W0r01SEPCeLjth8eiKtbJ8nGZ5Hwf9wtS6GmLZ3TRQ+mcOsS
	 XbGQNS3NfPGWhKsayLXYUG/ftzPgUR9U6XXz6rRgTTMfu6VnJ2mMpAqcTx/AuoMaEKUXB
	 z31fJOTn0ioiKtsWURmFlBrbS5gXCBOrzNpyXz51RJ8RZUPJPI8wgO5WJQOl5EhQH2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3FG4lgO;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C89606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 12:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C89606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3FG4lgO
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c35262674so59418571cf.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 04:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781140; x=1796385940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3lhDYV+i2Vv97Wklqtcwj2VftWjhscjN/NoyT0MfjA=;
        b=f3FG4lgOCCV0PGSTl4NAHOcoSltrU+6yDNdAqDHMNvjdomlOvjAf7A6/6HjMLsj9sm
         J7h6TH3JhDKf/8b/2ws4EsOVYFhB3kSxGngI60prwboMdEOPzqC/C20Y/zcI28HALYfw
         BPEuGWvPLPn41O47XMMJ9+xECXnBVUqIOiZwkjpODerF3kSLukjfU0ciEuVJ/vVQbKTS
         wsAhwTi83ylaYgwTHpw1ULj+/2GySvAWBJqOzk1wirQW11AEibjiumO5AdZaL+NkG3v5
         QJGz+vaxJ437kdwZl8kYfh1f5O3P+Z2PLBRuwo+tPYN2XKyyv2sGnBbIzLQCjeqzVSmh
         MuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781140; x=1796385940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3lhDYV+i2Vv97Wklqtcwj2VftWjhscjN/NoyT0MfjA=;
        b=hOaguDVSOHu29sKYp4F97ZBGIxwIfXM3TFW/KZ1dxbYH/b3OvNt9xJdl8HCMmdV11h
         q8z/qEek8OS5+oxOxTs4Mu7FQiDqnffz80orMa0f2jAAgSA+VQPCt1kMW3JQAo2u2v1r
         YgWxe0eNbv5pS9LKA3h/5Jiw3k2cIyDjvdhjAGNrUPpXFEfvDhSfTQOcFrJbICXLCpA9
         dilDMIT/SUcs4APfcbVO/qwTxx6IGiWGemcrZ2F1+xFFQmHQQBmacP1dunNwSQf3/XUj
         RXgJSXcewN2pRsck4cQnYDj1ZDZMiIQE4+w0BeDQZOPeytEGyIJh79xTosjp4/dPY4ug
         ko4g==
X-Gm-Message-State: APuU4Z8vQY/V4G/ZIscLckILGT0BF+2twktGXI42/RkrVXt+PdqpGvLO
	87ZcE1TJS8ss0Mi2pbPSQKehNVLe+IW3EfgdS5XbJxXe6+EIXAfXFR5M78ivXBlNy2M80w==
X-Gm-Gg: AZFdTZfISNqaVJaX7Bgm5XtNx5gpJIDRo5ruZGWRPOZitpYq1QwgjQxYebLs35ZwCqC
	TghhXdiI3lx2jIsmb8CvQLO6cxMz4LoYi9MLf6pEI4A5dxoVF6GN5atNY/CLFYaLcn90LlHMP3c
	UHI1D4/xqaL+29BIde6plwzhs4JoYXs0b8iV+riEjPlefUh8BPUa+sqdyBjLfhMTjY29icATEPj
	USwveQa5C13XbzNTH/HD+DfvTC+BcDpZqBRspEdmIHfpd6WKQKDm7B175/i8H+g0iuTLVlogfuw
	iAT7GWhVpxaBZkNnVHZLIv7QHKtFAf5y53mrV17fr33FK6ayNeexmpXKiHJv2GIoCjK7osGNHH/
	RwamyP6tV2VdpHJ6Jrlg1BJrwvWLbx+BdPBDrEd0rc7Dnd9zKZ5/84xR9Zym/XemwmC4yft1ouj
	8g2KuWSSncHJUb0rASPz9GZc0Ti/lGdmkLdl67icpcGWfPk6bVwsf9aX1phkBMMJOfejR3R22Zd
	jgo8lYKE13nY4Z9TMGvlk6W73tsvrcCG5U0hINtDONlxZSPAYbu6RbygPaM05kttwk11yTlFbaH
	ZdOMMTDkLwYHaBplQZBdndNgQVN8z4N0H6cNMLwb0CGvOzTWbLd+3AdlPa0mnoMe0Y+tyS12hbf
	D7o5DEPho9PGWqFbYMxCbVZ4ULA==
X-Received: by 2002:a05:622a:581b:b0:55d:324a:81f6 with SMTP id d75a77b69052e-55d769b928fmr444454351cf.20.1795781139909;
        Fri, 27 Nov 2026 04:05:39 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm208858671cf.13.2026.11.27.04.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:39 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: cfg80211: order the last wdev put before the wakeup
Date: Fri, 27 Nov 2026 15:05:37 +0300
Message-ID: <20261127120537.34-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
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

cfg80211_unregister_wdev() drops the registration reference on a wdev
without a netdev and then waits in wait_var_event() for the count to
reach zero while holding RTNL and the wiphy mutex. The last wdev_put()
wakes it through wake_up_var() after refcount_dec_and_test().

wake_up_var() requires a full barrier between the store that makes the
condition true and its waitqueue_active() check.
refcount_dec_and_test() is release-ordered before the decrement and
acquire-ordered after it, which orders prior accesses against the
decrement and the decrement load against later accesses. Neither orders
the decrement store against a later load of the waitqueue. So the last
put can observe an empty waitqueue while the unregister, already queued,
still reads a count of one. The unregister can then block indefinitely
while holding RTNL and the wiphy mutex, stalling everything that takes
RTNL as well as cfg80211 operations on that wiphy.

x86 is safe because its locked xadd is a full barrier; arm64 and POWER
are not. smp_mb__after_atomic() supplies the missing order and costs
nothing on x86.

Fixes: 13c20e8be327 ("wifi: nl80211: prepare for unlocked wdev-only ops")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 net/wireless/core.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/wireless/core.h b/net/wireless/core.h
index e70a4f679bf5..5f5144b36217 100644
--- a/net/wireless/core.h
+++ b/net/wireless/core.h
@@ -276,10 +276,17 @@ static inline void wdev_hold(struct wireless_dev *wdev)
 
 static inline void wdev_put(struct wireless_dev *wdev)
 {
-	if (wdev->netdev)
+	if (wdev->netdev) {
 		dev_put(wdev->netdev);
-	else if (refcount_dec_and_test(&wdev->refcnt))
+	} else if (refcount_dec_and_test(&wdev->refcnt)) {
+		/*
+		 * wake_up_var() needs a full barrier between the store and its
+		 * waitqueue check; refcount_dec_and_test() only orders the
+		 * accesses around the decrement.
+		 */
+		smp_mb__after_atomic();
 		wake_up_var(&wdev->refcnt);
+	}
 }
 
 static inline bool cfg80211_has_monitors_only(struct cfg80211_registered_device *rdev)
-- 
2.43.0

