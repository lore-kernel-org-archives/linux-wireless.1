Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033125;
	b=yqmLgKS7t/y+VhL6mx4cYiUhQp7+zXwYlAsgwksEdKwIV/Ph0mSjiBacG8EAH834GBW7
	 SBITM+Orqb7u3LuhWDBuQj1R1yp6ef9oRmCFe+MvAam7xCTO6HSTv3521udxRDtTtYU3M
	 5Xh4ldXsC0Bo5uVOOjkZlMlll34RtebOU9ekxqZvwckB55nnKhIHJMiiCCQeb9bVjssa4
	 kjyLijdC4GxiU8urkq92LNthkLOQDb+v1xlmddo5vp0+e/uwv5EoE3JVtWXvjwz+0E8hV
	 xlrGNT0u3eNIjMvGHHbnUpDJ/4pFEh8fJRFf7uRW+T3i0l91RsMYx/6kwETSVkSHCLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
	b=NW/03LUsHYNgzS0ctxuXgk67p75lgJe7Ky3Kj+Eug0B+gUIeroyW+5oeLV7jxQd9yIS+
	 F7txsadRVetcuuwTJCqIRG1JzcQL5Qv1ZkdaxyEdPfmlGtWf1fvLtoiS5kC2GwZoB7lHf
	 MwDqsrxLdQ2tjMw3Kve6kK0ErbowJbkZ5mXjFGykk9ZurTDwY/V9UlFIsRiMF5PXi0KxR
	 8bVXs7TUCp0BVo2u7vdw9t2JrGjAKjdRznjoqbTRmKF55kGWqmZYwRKJ3q/9yOUuFfGIr
	 qFqWnH1LnsJRfFXk4jTfGI3rsk7M0YTZr9kzGkKz4eQYc7JB55RrC+85hJ1x3BMTTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Qf/F+6WG";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42D1606A32D
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 06:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qf/F+6WG
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso1976752eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033124; x=1794637924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
        b=Qf/F+6WGs10Xf1vgWbsCNbI3N90FJryYt15f4rm8bVD+Gwk3U6d427UWDlVVa1tVOw
         aNokICV0mFMsKfzeuVuM59SpyYpyH0dWBt++FmYwxBybpO/hICQRrnblpYJtYLy5yIz3
         iVSb1knVi5mhDqUFvYJUZdjJW/AfEFx4lfpTfcnBR3KdY0ZPK9GnsmCQqsOnFlSdbXe2
         qK1a6bwA6J6JTmjFwMSs57lvVrPQvJDBmPXHPSV7fqZmGohIPfPYJ/4GU/g7aRZi2xxc
         Y7ouo/Y+FXuuqBDJJaTVAqtRLCjicidxOKMOXMEu7qvoPfLqh4PYQqgr2Q/gbhkHvCum
         /eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033124; x=1794637924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
        b=t6wYDA8feNijc4y6yFo5bM70YN2kTE4akCxMtudcsz7mV0uEt2nL1y6mbQWxdUnsnL
         Z0edhsCkWBM0CGmbtCNMKqD+Dx4iLzscR9QAADZU/9Se2dPQth8vQp3Hcvf9ySurnQkh
         3slVH+7BhzOLpk+uC+qo4OnsQJuyut4URwEB88Wdb8JKU7rsFzzg1S5wwGBi46XRbqXn
         Jqc7yltihWcXpBicO+5dgC1wavBi2jzjgNB3n2OLmvSxiKKw29noEz0VH1hv52h4TP5T
         BwsWMlTdUlNjP6el+aib9nTpLk2yEC43y2Sizxdwsh9OS7H+rOEHBiZ9m46hHi9OSi+J
         mvKA==
X-Forwarded-Encrypted: i=1; AL+hErHX+E7WPxQiOXIl1OkXKO0T4vUVih2xVXYiydQwkuOwEsmsb9epxx1o1+POq1k6p2FPhva5JLnFk5awGqLK2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wIN5E5Bmk5BEXGmoY6nwFX+pAwsxQJBDpT1GK7rNd/b0MCkx7
	wW2+bi/IX3RsI7BNwWreSwz/Qlwuq/6DJRP45rPwm12Fgccxyd1Vt+Y4
X-Gm-Gg: AYBFou02ebkPTKEHbvMnCqqkHrpygGh54L2eCFdU/yoyeBAMUuFGTKXv9rRj3RWxW04
	voO4jukARjyyUW156TBkzEK8H8UDJPEmGWvxfjlShHE07CKjdKfrqgkA6e3oSMji83/EfLqnSCm
	AOUDSmt2NaqKGng6bv/K9CR2FvZN/mQOgnCiEcHkffa8Ny07dwoZGJtKCT9fmOXC7XdGonRjIw+
	qFEH722WqE1JlRbWiLnaGe57o92jXv433dmFzZN6nLCsN17TTQGADO186g/xLRHfqyWxKPK1sXl
	Y/f8ffwnXMhFoz/LoVfd2ubrn5DA+cXQ4udWs+udJGZ/ultk6qAEldbUdXPEH1YZmsSKe7uPFgU
	uJKVRWPrD+kqwof7JV2ebUXsrYeqE6QJCofNniw8hsvEcxHuxrjTftpNUxYg/h/DzWLjJMBYh2w
	1V+/q8yOIBkjLs1jABIm6GZdFn0ZY8gbGBBcuug/AYimPbAMuEPrNC8LMxz9ZSLfN1fTVBPCUUj
	NK6z4OGmBSkpm8R1JQ/6kutEKF0+dlk4wJowzfhXhwojgcKFDQB9l9UMkK+8ctW+U54QFypVxiT
	5Zwi07lB39GE/eEgBwUeBMGIYaxwBRyjH3wyjg==
X-Received: by 2002:a05:7301:18ac:b0:36e:c04b:53ca with SMTP id 5a478bee46e88-36f76c11206mr6774309eec.28.1794033123828;
        Fri, 06 Nov 2026 22:32:03 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm14871748eec.25.2026.11.06.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:32:03 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Sat,  7 Nov 2026 12:01:41 +0530
Message-ID: <20261107063141.25442-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Luka,

Thanks for taking a look. You make very good points on both issues.

> As far as I can see, this timeout doesn't always mean the firmware is
> stuck. The comment in __rtw_fw_leave_lps_check_reg() says REG_TCR is
> only restored once the AP has acked the null frame, and 3a2dd6b7cadf
> ("rtw88: check firmware leave lps successfully") says that frame can
> take much longer in a noisy environment. That is why the old code just
> cleared the bit and warned.
> 
> So if I read it right, a busy channel or a weak link now ends in the
> WARN() in __fw_recovery_work() and a full ieee80211_restart_hw(). The
> watchdog leaves LPS every two seconds on an idle link, and
> BCN_FILTER_NOTIFY_BEACON_LOSS leaves it right when the AP may be gone.
> This also reaches USB and SDIO now, which had no way to trigger
> rtw_fw_recovery() before.
> 
> rtw89 only recovers after RTW89_PS_HANG_MAX_CNT failures in a row.
> Would you be willing to send a follow up that does the same here?

Yeah, resetting the whole hardware right away on a single timeout is
definitely too aggressive if the frame just got delayed or dropped due
to RF noise or beacon loss. Using a counter like rtw89 does
(RTW89_PS_HANG_MAX_CNT = 3) and only triggering recovery after consecutive
failures makes much more sense to prevent spurious restarts.

I'm happy to write and send a follow-up patch implementing this.

> There also seems to be a path where recovery never completes.
> rtw_leave_lps() also runs from ieee80211_set_disassoc() through
> rtw_recalc_lps(). If the check times out there while the last interface
> goes down, or on a suspend without WoWLAN, the queued work runs before
> drv_stop(). mac80211 then never calls drv_reconfig_complete() with
> IEEE80211_RECONFIG_TYPE_RESTART, so RTW_FLAG_RESTARTING stays set and
> rtw_fw_recovery() does nothing until the driver is reloaded, also for
> real firmware crashes. Maybe rtw_ops_stop() could clear it as well?

Good catch on the mac80211 lifecycle path. If open_count is zero or during
suspend without WoWLAN, drv_reconfig_complete() never gets called, which
leaves RTW_FLAG_RESTARTING stuck and permanently blocks recovery until module
reload.

Clearing RTW_FLAG_RESTARTING (and resetting the hang counter) in
rtw_ops_stop() sounds like the right way to handle it.

I can prepare a 2-patch follow-up series:
1. wifi: rtw88: ps: trigger recovery only after consecutive LPS leave failures
2. wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()

Ping-Ke, does that sound good to you?

Thanks,
Kalpesh
