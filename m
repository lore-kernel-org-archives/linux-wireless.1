Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194119;
	b=jyI/Qd8F3UUAyb4oN4VoU4Kw0OSTN0/0PcbunqUgUhtLOZJIHAmRsG4y6+crLkbEuW0C
	 LiZMzuIRF3HFIJM18fEgk+FSBgWkeNCLvKGH717Cmlntiem3MiHSTPuJYWonlDEpqFSsi
	 rC10maXdjnLrr+T5G4x/V69rYnPp+C7KqzzmanoaDDzwHd8sge3H2FMoncvjbXzSY0KJX
	 WK5EWzqNxy0kR5nIQEbDyR7RxUii1Zw+U9vctlQNL7PomGOi02BBMMBIZzUn18byzaE0p
	 X9mZ1LeBPs4yYuwqkfChdOLccmozgPazHDXa5b3sC6358bIIyEtmQrUBNg66aIaM9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
	b=byRBVR60t1fQa6nyjZdprHzerWOwJXN+DbU/SgQcdNJjTpwBpLUSr07FSA12Qq46zN2x
	 Big6tTdhcx55cnD6ZXCs5lyIeiZ6f9O663jHmcioa720kYHR9abODi1sZg35h43oiJZdS
	 GMuRXLEvF+P2PWu9uwKOyfFlq4XiqYcyQ6gmhYKzkD7BepZuusIZGpOhfqMVT9yW4iQgh
	 estrY3TAmt0nG6RxASdw4ctArWTtW7TX9hAY5RmptWorP49Ic6bL0thbox1dAPuCqR28E
	 lq3rBsEMWkHuhnea5YgE3lEK5woDf02fafFfcLmjxCHb/Y6yqj4awji8FP6ngKDznZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v52Q9+/8";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0B260A2602
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0B260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v52Q9+/8
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so627042f8f.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194117; x=1795798917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
        b=v52Q9+/8Dklb6h02lKEf1SbWbT7qXj1sPUSjeRePBdYsWDrv5030oWp+fe6R+VE85r
         Orw9/7uklJxMq0jYh6yZ6pLxbNZSH7GKfKKYwAFtGE2skG9QrgMqotXOrikTd2eYb1Lw
         RhAHS/B8cVgqpXEwOLAeYM/I/Bk7uzb8YNH0F6d3K396nLDQDe0y9hJBS/59EsjHARJb
         PCIdjISJLpGQ8WHicipYKBW7z+3wXaugJG8UfGpwNlidzRvV3r3J4JXdmKS2yWv2QCEq
         QyJr2JvC4U4gStYRPGDmhOJjzshERYia5wT1Q4dvjpOI2uvXGiSg/xWadSeGbkjYFDdb
         KzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194117; x=1795798917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
        b=n97fa34RkxasHvcLYnLVdnzn59UwRS7AzryGhy8UnAZTujLgGqh4NuSEjcO7j5pOX9
         yhR/KhD9zfYFtCCxplviRfS1c4LLXcDcSd5Xuf7pZJzh9ekLSzo/DYWC0o4kUvmWusXB
         u7jbqb8Kfkt0IJGnyrGbfaqO7FZ3Z4bBLnnFC5u4VVvJUkon2JvWvSej+3FJHSt+BFR+
         posuEN6wg63RTVGFn9sBZ9SUf9Z7NSXWiIA+593qsKXuGBD1nJgLzCCz56fPcxtCvDFk
         /4tdYZ1kxEE07lMj2hl9xbesNeY/6eULKno3Bos/70arkIXp6HERtvgcbxYV15TwvpoO
         EPQA==
X-Forwarded-Encrypted: i=1; AL+hErHzS/jP4rD9cJ0I93PEQUPLmGG+Qwj2F7llzSX3gWND5/TYjlzcSuEQVzEzD58zl8AmqKEnkyfTKYvGrwKU1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9S3HbvsoDe9UKAsd+eBsWqLHjJ5vUvo8z1zfb6mWwrMvWg9O9p
	6pzJCugd1kyarV+PC4IUgyFUU+XOHhV+VHURwzMzCDtdiN2k+51MDH9W
X-Gm-Gg: AYBFou2SeR9QaSIX4mUalMcwBxFfZhDsGKACZxIbNKLxgeIDYELjO59gr/T0ToUVi8q
	lW0b5xBbcN9BgydLlO8YmtClItHDhz9Nds27ikOqjUoCwcy2QVjPGdlyAFqkeksVcGPJKM5WIYQ
	YH7Tm1uAo0E1nnCandGUMiOH4OjMh8SazJgQxFf9SYCgFYIaqINjR8WtTsuJ6uDdi/VFSRIuyKS
	UAJkxeICyMWELHvM40OmqHJ2QLTBuYN5g4+OIRbzzPybhdh+Fou7PBRSb71Prt6lD3VpgZIkwYc
	i/3HZDSAJ3Mm8bbSlw8U+8N8/9hEpc4H/l5jU7H6Kq20pCCrMVluhl4F4rbEUrH4DdvmPH+PyZb
	MWYQJvqyG7pYoFBJXWqrd1o3oykHCXHxKPv/f2/gppniwdVwN3UGRpnyybil3LQzvtuMXxdsXsE
	4jtePDbbFQSUMAhlct84XbEZQhxRQMn4hvkQ4Nxm9Arh9/dPwKzoLlVTvXU0e+3TiGBgjEz/1Kl
	Qn7D+ftOPDY6s88//5FmzK6CShVSYTFEdiPCTwDDGdtFCdbHOyA6wOOAmKDWtGYidCRH/Nehoj+
	8RdH9yAAbn0FrWEiG+V5y0a4kIBfH5CX+Nw=
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr81948685e9.17.1795194117022;
        Fri, 20 Nov 2026 09:01:57 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm146540045e9.3.2026.11.20.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:01:55 -0800 (PST)
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
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Fri, 20 Nov 2026 18:01:54 +0100
Message-ID: <20261120170154.374502-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-1-luka.gejak@linux.dev>
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

> Could this skip a download that WoWLAN needs? If suspend flushes the
> recovery work while it holds RTNL, ieee80211_restart_work() cannot add
> the interfaces back before rtw_wow_suspend() runs.

Yes. On an RTL8822CE with net detect configured, a firmware crash
forced right before suspend made rtw_wow_suspend() run with no port in
use. The download was skipped and the driver logged "failed to get
probe_req rsvd loc".

> I think the empty list warning can still happen with AP and station
> interfaces on the RTL8822C.

It can. With the window widened by a test build, a station interface
brought up during the recovery got port 0, and a queued beacon update
then hit "Should not have an empty reserved page".

v4 follows Zong-Zhe's suggestion: the reset no longer frees the pages,
rtw_ops_add_interface() frees the old pages of an interface that was
already initialized, and both port checks go away. The lists then stay
filled through the recovery, and the TIM update you raised on v2 is
not skipped. I will run both tests above again on v4.

Mehmet
