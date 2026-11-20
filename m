Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194178;
	b=2owbw4pf6VcBmmX5ofLx6RElb0yNnVpwhz0jL0u4eHHg7RwtsA0XqBPCMUZx30IeZ4bV
	 C33slbylfNm+nGcFHpBf8SneDH9JCsf81fslroSRaXgfvgFBkpMfBzlw7yB8Eqx/mkrVl
	 w7p51AfN8fIRgCaXtuQJvpDhlIfHofmwmFdz3HYG7PIVIYCoBhB1cgR9o3axazjrsaouC
	 FHV5O7XkAcX2FKO5Obn92xnc67XnzaON+NoLBCLJzZk+9F/tk5+kGh8A1KQghkYUadkAS
	 iHjg7XMCbEFj8x68/ER0zKRo25AWM//zotETtcy7KImgbM3l4sKc2m/ic+RRVSHzMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
	b=2c567YOft3XlJcpBpBhF8JkhbCyk7z/7PbZAb6jofQiC40l4Lr5cb9HgQ4/V0R8ka8lM
	 C7MPkYUCazF30vUEsx68gAtKM81wBIUhuNSsJyVpz4JjxkhuN7M4YfKREl+rp5j8+N2xt
	 y+FIvikKOj5jJzxbacuj2XHk3ieCeStcHoZ42dFcoOYMHSz4U39a0UJHz8mJbNhLrgTJC
	 NzVY41/o6NWb3bEhaulzMEDlWM0uAu99CnMX1W8rBsm6q+PRGRMS79qKY2hEKDmrtx9Du
	 9vJ+CKpb3RUM/OkKwjb6dCEltaIAZnv4tMPHw3ltYpc8qJyHhVonfqhsfNWDzPcCx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zPckSfc/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C407606A33A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C407606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPckSfc/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10891905e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194177; x=1795798977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
        b=zPckSfc/Gukj3zaAaxTNGkiGJTsl2RxWYFYBEwLI0CKsbfgKHpZeZnO7CnIA/I2h7w
         AnhCMO6W4drczR8jl4DTPL4Bn5Z3KbV+0tHMPYfEoOFnDBiL1fTn3Sdh/UNKakAqs5q5
         tLLq4zyAouY+UGrnCUz5lOywELaO7jiIcOA3QyjXCPo88nF034rKT5ZeVp/Q3/dK11aR
         MKMaCxt8U63VjywEQjugk0qOmn+/uxJqh/dksEChih2Mm4b6m3kSDACGAiOs7yxU0Y9y
         Cp/nbP76+Ii+qyuTNjxN1OBc7qQO2ZVfWzZujnQLqHkQ4d/v2FUdA+IbUqLG5qSV6d35
         V0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194177; x=1795798977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaLrPQqGhCHyL4V5RInTE0OtNu8pSLaiGG5NjxeuMfQ=;
        b=XrrWgkx615H/ElVmgDPpy0okaOS0JCmmca+3+xZvg5wJlslE7tI/31owm0qA1I9+e3
         pNwvXlZ/3KvsPTr1+CX7Gx8xzK4rQMozCe0HItk3ST3Sa6uQyuznlEpQMzQsGoTFrmeO
         YxMVhXTiOwPz9l3oDEQ1gZbSbO6pBZQ88YG0kri/pzfDPMuQCnoHcDMa1obFNN7Nk4q3
         FJW3dK6fZyDBx633Jd7chXEeMqll6AXGZ8ZWYEwNgOtt401RF23p6NUQRV1aSrOfjhzb
         IVFIMKn/aQlgSuMfj4DDruEhPPdtGcCnqBE7IIR+zvtDMoiI6QwsX+zdVgmh8FsnfFqj
         GxIg==
X-Forwarded-Encrypted: i=1; AL+hErFH1SJTmamU4DYAxn1SQsxsOfAer8SN2j1hFsulAqH9ytW6CTaPHmKbWBAM8I4JqAtQGk3zvLLnNPizCz17vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zij+xC83mHvtuvporJXHMuxBkTrgsqsTk6wEE4yXu+UAwj9V8
	mNVYhr/Qgwghfkow2qC1IPC/EkNMB4K4nRsZRYH2qyVHp/hXW7QzeJm1
X-Gm-Gg: AYBFou1PcUYhRDJd0G+I7OdWhFc8j/xByzc1KD5Ow7p0QYFBthPk4l9VQ3VpdI3jbXs
	F+ceyA3/m4HmP7tJMFvk0exmFR8Z/nXkLl5RMgHu+PRN3OgnYUIpr2k5vzzPT+4lBnGjk0ZQXoV
	vmHGc6u5suQwo3B5sZRzNZPBmszdZfV+V0zLFhyEAPqnfr2JILpmqCXzv8UWNSihqBih9xvtHUz
	opHfgvIfV/ElgfDk0/yqHFwN86POI3eIfkkOJLZb1nju3pAvuDBVtZAq8rWIRlPAU44Knc4C66L
	DoYehRsS3Bjfqlstufuzmk/NIXI2QHwaBsZaCEY01Nnll8M/N2kos4Fej/8cO9Xsc3P03e7MhXO
	eFEQ6+tBn1J5UevQuqtXHMbXoXxdDgb6TjEUj0i+LU/TqyrWfxJlGzYoGwq3p7mQMmofLjFGaAN
	mmbuEjJX7mQR113bev3RGm1TdrdRioT0ss3w5ijylmI5PqOjV1aIQwrgVUG8powk5jVXEDI9YpC
	Onq316pQ5kPRKw4Ti5Qll+49nNgVaEn2x5CAs2ebdTRSTFuoupc5uw9H7vsFJAPMRxCPOxUBbAP
	lzrg4pLODoEK6DIQwqqz5QqVgOr8JMWp3vv8AAbn+kdc/1mLojUsohgr
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr74757575e9.5.1795194176575;
        Fri, 20 Nov 2026 09:02:56 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm103258085e9.15.2026.11.20.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:02:56 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Fri, 20 Nov 2026 18:02:55 +0100
Message-ID: <20261120170255.375054-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-3-luka.gejak@linux.dev>
References: 
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

> Does the driver mutex still pin a client that has already gone back
> from ASSOC to AUTH?

No. I reproduced it with a small netlink tool that clears ASSOCIATED,
which hostapd never does: rtw_sta_remove() ran, the watchdog still
collected the client, and deleting it while a test build held the
collection freed it in mac80211 without a second rtw_sta_remove().

> Could we skip stations with no si->vif while collecting them? As far as
> I can see, rtw_sta_remove() clears it under the same mutex.

rtw_sta_remove() does not clear it today, si->vif is only set in
rtw_sta_add(). The client above was collected with si->vif still set.
v4 clears it in rtw_sta_remove() and skips such stations in
rtw_collect_sta_iter(). That also stops a firmware recovery from
calling rtw_sta_remove() a second time for such a client.

Mehmet
