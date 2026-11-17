Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908715;
	b=3NC4AvxRlEBjXfKUDTrs2CC4TvNKr6IzEKUZVESsmEPxWORS7qR5N12K8Ixgt8oDnPh1
	 R1x+EiaV1ndadjCe3E2OvFx7TgApAATzpuEKTC9Fw+5utwoemB40YgsJb/XZHfGiIM2Ut
	 caQsLRouYJwFjdz1ICwA4zn3lNwqcBEJiwR7R4IJOYhditWhC27AuxROlcdBNMJG6K2DI
	 gNZNfjL16Cs9YElJ7zO1vxFRmSFk8fhFyIQraLxn2RtIbdGoQPqMyTPaX+YXyFKHJwWDA
	 RcjP0YVa4MjfInOtn41RBa2/jR9CslNjEqwYS7pvQIm8HRqoe2Y7Tnbrc0JczPIp7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
	b=ypFTesk/h6H4l2Z8eeC/CP+LwxCtZs8pO7lXm4n6DD8td7wD+p0JOKUnOYormv9N70M6
	 hGC0QcW2bTYaSUNcsGMD6wcRxXhXE/uo5bsodEiJo9U3R+kLycSdOO1PI6GexyPAYCJZU
	 kI3mWWOOzIXRpZowmBGn8mH1tJBR76LeYDuGBAPa9LiCj+3Z4hPPlFt27rjHasYGZ1dab
	 SaA6auhz5XWMA8GXgbbCFQruIY7JqZ0xf5F+FAbNXF2LJpflq3lpOnIXV0lwNCKq7CpDe
	 vDGrLhaxUx0x590HuEGAoKJ59CH6cDgD5Bm9f6F6mmJwhPMUGl3sDTfiaIGpGS2m1Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt9LoZT8;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC9606A880
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCC9606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt9LoZT8
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a32576da88so503901f8f.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908713; x=1795513513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
        b=Vt9LoZT8JVBNJWGqUF7+f7t6Dw7NR7F4RsK//7sdcQLDNA8Vgr2TPlZZ893Vi+698v
         GIIchLspIxslQTf3LxSY70otakMjQjLFSgFKLKlWobxHc4d9B+D8Zwopu/4XC+w5uDTy
         ACAXX8Qdc1RM1nqXs4NsmlX3R6VpWy+X9O4gq6Uf3V1hm9SOetCSoK5HjGizgfbA76er
         KZ2xT+U8IsrCACRbVu4vyBCYnA4rYbcwDPaUVOKrpCV9PfdSNFwC7sC0MPArbL4PPGlo
         wfJGb5lukc4RRtm+wTKBrGJAdwgQzM0orPIloCxpOXuT95NjCb+PnXaeAPVT+R/rQWwo
         +a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908713; x=1795513513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
        b=bkNOWArehlU78oVtBPQdlurDWfQRZh0lH/AFRa3dmvg19pgMChnqkTkj3yQhOeyydA
         WFAeHN8O3j2KHOCOXOE046aJrnyTSFijlAtyNQoN3ikTHI6epUIO/NlaJcR4CNSNIXBi
         KLc9BPoyYs91YntNfvnXKqiQWXFsI1NeaiavEAiVwfqRryxcauP2wH5M+C13JtJrXpAn
         SIQWFVFkXDPXnfvtYibh9hLopmcIdVu5ECBrF2laVi6l9f3nq+PyGqQIJ/PT3ZT7cUzA
         E/SDBlUHo8rDQwkM4z8IPqFWSV6LtSz09Tn1y1p/wNIURsUQEIhoVBuKTjPxYYOqWxk7
         VGMA==
X-Forwarded-Encrypted: i=1; AL+hErGoYfunJIGakZ0ntYsvDq8GRiBmyAGPS6+J5rocPlQ+SdnTK87gPiTYyKFWhNjxuMiwe0PeABeTkBf8jaKF2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vx/6StxCD0wd6rGkWIALCEfHmXJQKq/GarX5QfwCRwrA1lZyL
	CfzhGFCPel4O6Tm1zLWPgsfKhBsNyRvP5QBn58me4sdXizKLh06XKuCi
X-Gm-Gg: AZFdTZc4r3RUW0q4AqhaJp9Y/gNVENZrIEvhqZ4as33zQXBkaDcH30vjLFfPB1YOwwG
	uXRbsPHOodEoWmHnUxNq/dtcCuVHk9VY0eahhLRRA9Y9Hz5WhEsfNOIDkU6jL/hqzYyvvCywY/Y
	F5h1HETjgPQfvtLY6MhM7UnxxabBL731e/EtQv01bFbUTibjWhJVZEBsVrzGigapn8AkR9SAv/X
	aByfpRuU7i3IO+wqtJdAAgzmhMYAZmv/Oz6i/he+lbi9kC1ZDPQhexs/Wa0nO1Q/HNEKDJTV/2q
	P5DFav+bJ/nxLa1+m6dWFGhZeUjdIgKqymhEzi+ACG9wo2pjRcoiIY9C9o6kLcSPSI1mU4gHkcj
	mU5OaFJQcYTmhZ7CO9eFj9lkJKohVNk8EQ9lGfS4w2IVlIN/lFS2ttNkEIbREKkEQJz0cSkBz0s
	EqxQcaHTWyYRDO1EoQOGwudgm21SepRfFKArr21TMfILSQaNj70JrfnIFNq0lOEJL2sVUTJCpon
	VtvX0TF4n5Fg+yDd7jjL7tKOhuMpKLi3FgpP1t3CRCGfYSfJoSnzXxnW49LR1slcn/slJ8IXiNH
	ESXb3xidElzpWyJmOjVK9AeZD5aB9U2YwnA=
X-Received: by 2002:a05:6000:4707:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-49c729bb45dmr27372345f8f.40.1794908713252;
        Tue, 17 Nov 2026 01:45:13 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm26969698f8f.18.2026.11.17.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:45:12 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: program the beacon interval
Date: Tue, 17 Nov 2026 10:45:11 +0100
Message-ID: <20261117094511.1677990-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <3bd4a36de66948618d80e2e6d138aefb@realtek.com>
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

Hi Ping-Ke,

> Please white list of vif.
>
> As commit message, here should be vif->type == NL80211_IFTYPE_AP.
> The rtw88 can also support NL80211_IFTYPE_ADHOC, so you can add it as well
> if you want.

Sure, v2 will check for NL80211_IFTYPE_AP and NL80211_IFTYPE_ADHOC.

Mehmet
