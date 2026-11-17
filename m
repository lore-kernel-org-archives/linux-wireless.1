Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935122;
	b=TBNqCkax4hbgo3MQ6CcR4FYHCFbq9zBykG19+zHHarISPiTYuQXDrpci5MdBYpK5m0Dp
	 hpSc/CA6zvAHmgAcNLwmaJIn9KDi9eOxpT/zuqgoleW93W4xQBntk0LEUnrKgp3XiU7Yk
	 MCOQ4/Hmep/3Gs2q+FRyQvJgXRDt2nTR95yB10RM5bSZ+NGCmv3Cb4DRxr8bkukQ+gmT/
	 ZFfow5gTko/BaDacKiWYf/77KajFWqeoYQrUSITxj7sTDKIFGlx5lZfmUsUL78IXpX5Ka
	 oj13OLJkEbeEibP9aSsWqnRmVYNbq2q5o9AeKyH6737eka00u+p2ckFox8PPW+BJC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
	b=wWKSAdHVjb3FLMEkZxgRfarUrFaJWAhc+veTnev6eNFmupeF9bshfcIau0l2RLj2U0p/
	 gv5M+uyzm4G7XGJEj3MFjHVOw/SLJ3J6y14DlNWyMuvsqy/R6S5OvjibuIypBWSwq0ure
	 YBXGLUpidfXojmJINKsv98X03HaQhUZgWDeyICbdFpviwXlPTLhGlAVrAPBBbysFR9VsW
	 mn6toY8ZmF9+yWs6HuvVT97FYijZ+C4dAC27vzFDYYBlCCAaBnJdYZNXe545YXOIbkx/V
	 kEOmuEdJ0xZ+0beacDHHvBhKw3u4FQxKnKvVLlJ9KLJvnt8/Jk0pqKE01CFHU5dgTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbK28M1N;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49149606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49149606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbK28M1N
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso728485e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935120; x=1795539920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
        b=qbK28M1N4YWjbttJCYic/dFVN4BLpLvkkWjoWFWCe/TU/Di6m+mh8Mi/PTfsBqC0QJ
         XxAyiekZ9/w0lWvZMyWo/UPWdpT7Y3Q4yJQEymYREDuDtWZEzNw+8idpBgJH6UpKp1Lg
         jABxpyXYWjAKrgqo8KHR517m/3AnDHTGqj0dQ5CpWWg8wcr9eNar5WEiJBGMCzVWp3XD
         w9WJD86eGjtamrxCfu8L9k0+nOGOFxhEr1XxcbvnklX/yhFYH7tGBLu90nrhlqo7ChXE
         yZCocUhfRMvfpxAAi1Siv0+FADk2trMv8AJPW//FriaSaibbHANIPIWUn/CfaHhY5h7K
         4GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935121; x=1795539921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
        b=VeQSC8X/6v5k300dtNRzQ6w9mj+KPeREtFjniSncRjuF5ir4apqv4BksdB8UymVNA1
         gd3xQM1oU7CLQoxlAcY8vuu5UrE1lHhWAPdFHkbYDnJ7UaHWiGzcD+XRorOLbcdrI32f
         MnzeaVFev/mdhRFMU0axWTtEjMpDX5PAAO+jEfE0TU/QXn9a+dacEFUSA9eVnYbLy06t
         2Lk4U1CDhTsLdpIO37n1KTdyKMzlYicRUW+eLo6EGuvy4MIjrs7r8GKtb0DLa8TloZMU
         zulmueLA2janOKPZ1wtvjI//AvRWqL92Fn0cl7ng1aoapq3GXboWQ10Waie8coL+l/bP
         wYow==
X-Forwarded-Encrypted: i=1; AL+hErG8Bc2qB90KJD4+D6d8K3VCMJ5bqe8XWVPF5c7ktiL57gSPEON1DRpnZx8Fbv3jTC+wnnM5aXtXWTyfwqqcug==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mJUb5vsHkvoCneWW3cFzChs6JNzeh71xN9mmPOuP9YqBhAKLS
	M0lU6qUd7ReAW55yRqG3vBPall10g9+/lZVlpySchzrXpXbKrm4n5tNn
X-Gm-Gg: AYBFou1N/zJdKHpUKbkfi/vSHnDOZBT6dMHq5RkgU6osyy4dX+f43EdcuLVGSDOkRkB
	edjg+oLM4L56imieU6lX8b/zQyfA2apORxk0e3MoqPMYhjo/bS2KLr0B9apcqpQpEd6kUVLRNG+
	lUac6678c7nxnYWAKWfYVcCLIxH64/K/eRbFCU6Wrsr4DIzvv1gCdTsFHhdqwn0tdkZEx/P7s1s
	T1ZkiHJT8IlCvudtXZb9j9ozcDu9akOnxj0scjKJXb1anNPg8IDAnAfoDM6tKory5D3hIfeh4le
	HJbbnLDEz6yQB8rPtMG6oCFYk/O0TMaRmrYYNkae47HotOkAhEKTFUjy9n84GK9x4OCra2JlwQY
	cpB2RNNA6wDHMh3W8il5B6DuTqrNE8+0w96Ipv6O51lN5f4diACrBK5XdYCZ10PfhpgdvaoUxDM
	5Ax//8HUTzLfpJW/38BuBlw8RHv7TN7aTj5DYLkit7aV55xJe6/d2oinWyeo7XyVer00vD1EF/Z
	hL1uSMJ9NTzRzPTZprnSHd9p6ui9ZfXT6apX/632pJoOGS6kjtMNkDptJX/df9IL1gPuMB3X0ug
	t8dW8LnAc4sJfmq4Km4mm4Gsgdw2jBWgAM3GWh++SNvXCYVRNZUobmlTwA==
X-Received: by 2002:a05:600c:6992:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb68b9f729mr197712195e9.9.1794935120358;
        Tue, 17 Nov 2026 09:05:20 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm136645795e9.5.2026.11.17.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:05:19 -0800 (PST)
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
Subject: Re: [PATCH rtw-next v2 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Tue, 17 Nov 2026 18:05:18 +0100
Message-ID: <20261117170518.1838786-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5285DA11-651F-4286-A0FD-52A6051B3A88@linux.dev>
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

> Could a skipped TIM update be retried at reconfig_complete()? After
> reconfig's last beacon download, sta_info_cleanup() can still expire a
> buffered frame and queue this work. If it runs before the flag clears,
> the beacon keeps the old TIM bit.

Yes, that update was lost. v3 drops the RTW_FLAG_RESTARTING test from
the work. Instead rtw_fw_download_rsvd_page() and
rtw_send_rsvd_page_h2c() do nothing while no port is in use: the
recovery clears the ports with the pages, and rtw_ops_add_interface()
sets them again. With a test build that queues the work during the
reconfiguration, v2 skipped the download and v3 did it.

> Also, if the last interface closes before restart work takes the wiphy
> lock, open_count is zero and reconfig_complete() is skipped. The flag
> survives normal reopening, so the worker still skips TIM updates.
> Could that exit be covered too?

With the interface closed in that window, the flag stayed set after
reopening, and writing fw_crash returned -EINPROGRESS; rtw_fw_recovery()
would ignore a real crash the same way. The pages no longer depend on
the flag in v3, and a new patch clears it in rtw_ops_stop().

> As far as I can see, rtw_core_stop() drops the driver mutex without
> holding wiphy. A concurrent beacon change can then reach:
>
>         ieee80211_change_beacon()
>           rtw_ops_bss_info_changed()
>             rtw_fw_download_rsvd_page()

Two hostapd update_beacon calls in that window warned twice with v2.
The port test covers this path as well, and v3 did not warn.

Mehmet
