Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066426;
	b=dKUYsuk01674Cmsy5Qc9jQ2Aux0dTiB1cwNZDj4jxyUVXVK4msxASnudtkW6dQOgYYbS
	 YUzKtybl4051nuggRQ8LBNwW119MxLBzNWBmHBUe1OaeG7bCipPjvJ4P6KC8CXPSgWap3
	 GSYadbu55zjKHx1d57x+/vkc9Rh5ZWHno2BFbSPeYRwKeOfZLDJndUsKa8TIsxBvkrLfc
	 7WkNyP3B8Hk7lZy2djqAlQVeODsa81EqW15WC9DxSCUSz567d0ylDrpgS2C0kdniOHb14
	 OkcXbkH5HR119hKieJ9yv7uGJpexWG9qwgEuAmYxasWIgIppNtrJMDyypZZuFjYbSUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
	b=I0SUwRZBOQrGCrTXbROXUXXCSvfagj45b3ikn+QQ2gBHdwz0hHOAj43vhwC3Hk1Rvh+C
	 F9bxLwB9HFTvLwJMEJtPEXkOMWdvq8gRBNIC4Ee1SJlCIy2RdAMZ4x7rPSPCrUsXSq2YH
	 0B1gl9ID1fbZmvRtEfl3gnw6qrmCHqvuhm73zh9dQaCqdSm0kIy2FVLsVNXVavkxBD+cc
	 9I9GncVcqZLMfkwGKm433VZai1SXhTLrT+o8uHMqrBPxDcpXsY3HabMzYUUHPOp6bjEzX
	 S34+/iDMcwKnOYD7QE6NkpJBG5sdlbE5Ot7UMeI+yA/xAgalHlBFHg/+NlYppdVSHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4bqeSVI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FE606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 05:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4bqeSVI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso17969475e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066425; x=1795671225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
        b=U4bqeSVI6sYwgNQl2tqf4TOYgJB5GQ+IeqN1V3Ba33JpsePzwWT4hudHgoBAEL2j93
         VL0R0bKHvt9CmeuQAdHAiwPsQ4ZuED8CG3K2BAVXM4kGi8OBX6Tw8muwpz/8a+1YhaxO
         slei9CJH7RBCLw2mg+j5R27MYcWAaFS6e8moLNZUotN8h3i9Bw22Cct5uiEELE3Pic2J
         nlykA9pkGwIWtQgtBE/M8XDQ4jCBXCAqkHO2gO7VWacc63u/l4rEUXGsB9qa4W1MglNw
         njcujE+wieZnJzXyouXe70ttYcLRsnFOW6EPtB13h3EkgdmA+lPIskaJ0/hD2VE0nDBi
         9zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066425; x=1795671225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEkbUJSUtCTcASmRLkUsS5yQMfRPCSMeWVpSIWZdwMY=;
        b=j6j4RwS14AErI22VwOdnX9PXZXa+7DgaqGCfYt1bZj6seKKJBBNzs2KSxCLPO4wqjG
         RFfdZlIAYWFnJpnBNsr+V9zFO6yX+iOejOtmSTabvkMQe25EuAO4/O6kiPwwukFI+o5f
         1TtzLeIiaSAzRbnCMr/iVcvHPjme7qoZ3Q2WZgNR+f8bbSkj/2O7f7opyLDR31nQtL4R
         PTqYPWdZT07TmtWxym9izFCvGojOO0Y9Wkssnk5B1zmdQoiVTmkyjoUSRbH9oTZaTJsR
         OrFVFeMCp4C5Og85ah44fP4/Vn3sJzfFkFHREBY1o2kgai1PPUEcP2KGgg3FXNvXDeUP
         Z8jA==
X-Forwarded-Encrypted: i=1; AL+hErECtLrhFdWmOKw42NUpZ1YCQNWhZGIsaqZIFeyoQKrBjWdj6E+386Re3UoypGJ6zlY7P/0+v9ogW8cJuVJyEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/u/TnSDFgUnzC252Ji9cxqFrJbJG1w2bkMvlazWk8b4PeB3fus
	WX/5aCMpnTb7sjew1UnARoiUAs9hYMeVG9j/i31rohBpj4EnERAWAuaf
X-Gm-Gg: AYBFou2a5e/TimMenZ3CqM1JhLq42gG6RYnLnIp3qtPT3yW3C5ItmmNadzgfWaO3d03
	Zp/PrRKVsgRqG9DpBQ8zwhPMf6x5X+gUPA7GBZpk2mVW95ZccmuQ+GM0cBTmWhlcKryY0hRjPdr
	idUfou9kE4/6eK/+WUTYOmLzRz8mdwdrb6fLaNgmCfZgxrqPlFGFgRWzfYHXmJOX3QAtbHxg3HZ
	fyq9egH6dJuOzQIEZjg0Q3pfgLnK8m6h4JwmY0YK+qRzpOHQXitE9zMvhPcJHpUIa042Sp5rIA0
	OskwxUvpnwVCnKo7y8j4ssZjqc96nAg4Ar7a9oJp44lGC/0iucXr5M/83ltONkFljihEMtv9zgF
	wcSDrVZTxAlVJTbgo9jCOTKu3XigAvYG36I436pFm05EBYy4REClyxlpwVbA1JSngYgSZEmokpO
	SaiF8Gri987lqRkGRJs4dRQJG0sV9UcR8fjIlfbmJlDTGHr7RnCuxPkRWjShmOQdKXr41BaqAdk
	PrZPGKXJdJEbU3wfeTBYncMkit0ZcwUoVGtd9f1Z/b/NrsWRcLK3WNa/QfGCKNwHHq3Mo88aO1W
	kkBALO3EVenfb1bHtdGNdz5EHxL70/eSzEveMtOfpxfQO21JyyxQxE+8
X-Received: by 2002:a05:600c:1c11:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb7d57a536mr104063725e9.0.1795066424540;
        Wed, 18 Nov 2026 21:33:44 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm16530505e9.11.2026.11.18.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:33:44 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Po-Hao Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: find an associated station without allocating
Date: Thu, 19 Nov 2026 06:33:43 +0100
Message-ID: <20261119053343.2435185-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <50ac2a659ca340dda44d63b02ffafac1@realtek.com>
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

Ping-Ke Shih <pkshih@realtek.com> wrote:
> > Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
>
> I'd remove this Fixes, as my comment in Closes link.

OK. Could you drop it when applying, or should I send a v2 without it?

Mehmet
