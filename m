Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899703;
	b=fnsH1zZj7WoYtWqXHUaFRpH+mUUfe1MXeaVBv+INAKzl39bo0D0fBEfRveKFpQXIeIu7
	 zFOgY2TNQwMTdjqVKBY6bOTB2zblua5ZCc1H9Gup7wyfTNqddp2X7tq9VnkA4ucdLUj0i
	 qGdtqaoNKyx0rR5ocZBPrZIHjho6v38Vpx2hXfgIAq6pUfMjtv8XihDAHgNkuL87sbYQp
	 g+DbND/nHhgDQbXrb54MpAs8Q+D1JhEm7t5KT2L7h6244RdiCVbHC5cUXYzMfWjV+eL0V
	 wHCaS9xchn8TLwMLrUvQb0+bhSR9pfZBzLp8/jrnH1HDjdCFuPb4L+T7sscm/wmD2hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
	b=Sy2plubC5/QRHZav+8ZshxojUcubPUEL7Nyf1thhcKZFWmU5lE5AWPY42B70KqLAZROs
	 eynlYVdiYomQ8embFGenLWQZQmShGI7S4cL17yt750MP+JiiTZ7A7EErUnRRrpU7k2jNx
	 AMa13o3y2vcf2UbkqRgWRBn4bcF9J0G+TeQzQoXpOAFA8cx8XkIr2Xommtf8Up05xei8j
	 IhVuIqGc/Au9dz48cJG8Xl2bcJQuYRwa+57V5hJGB/aPwUJ2aG+ldnZqmksue4644mmOB
	 qMI6JPRmxjoj7lZBFulRYpHse5Ua8fnRtxzYpWI+7aBpLyEfuaseXEUQ7M2h+dUb5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEyMdSCn;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7982606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7982606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEyMdSCn
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso44124905e9.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899701; x=1795504501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
        b=vEyMdSCndnU5Xhwh7Mq4hy+9ryUOHWhefCF2211UShOvpGk7DYB7sLU3iVByjfCC2m
         HV0haF21sNhc0Xc7LdfQTSBYlq2wBFX/2o4/dTbrsc7IcPwWrBcvCBPBraZ6VcFyvBU8
         tyn8DnEuA+Vnbldmg242Y1dySkzTm2ihJ0tn3zoQaE+7hVojTe2YEctbRVFp+re7EmUF
         HGUOn4GdUCmZOo3GHkyqnmxgBecVeHNe+YCSlY9WbZ7J50mjXlsS6q8ePUK7nssjnXy7
         bKVtGSOGbqEQs5mlOcSViXEgjMu8RNz9ZF1jz9aWJj5sEvAr6QIL4mYq8j2+kHHRoAjQ
         OtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899701; x=1795504501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
        b=ZJHtWDvR8hsy/tDEn1GqiN9wxDF6+YGR4CwFGWkkbPaF+FCIlxOMe1PBn9tJLe9W6K
         4yVOQ5+5WJm7RqSpw2ADnNDpxGSJiB4XtaeKfa7dR3nx/510Luz3DAjKJud6ke3g8Gws
         Q9RKouQ4nuQZM3+fv6Bla/EeeLOypreb8W17ych7hADRgBALFqN52p4Ftjsc8So/ydBT
         ZqZW0TrJsvp7hqfTjlDkhzhZv6VYzJ6nGGR9C6o6qidLEFCnHBSAK3WXq2Hp0JTNrvYJ
         MhFzafPtKpsYeRRuEUO/8Zb3K3tqTbPUYpdhmnCDeQ/cBmrE/zEJvNYk/hYNQZ0MDXT6
         i3wA==
X-Forwarded-Encrypted: i=1; AL+hErH12lD/obOVtv66TCBVSA8D6CTzdP1/ZZsGVdHzmtZGIjkqSaeU+Ra2cmz6d0zKWlftzlKe9bud9ICsIUwJ+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QE8y0hC1dFh1Bm1rleRMdVil5hdrH5lWNbTp4A5b1/CBCfX0Q
	fWbu29PO9GvYhE4Ww406TSB415IsLMDzela+IdCaWYK5CrecJHMZi61fD7pm9yNG
X-Gm-Gg: AYBFou14a2dBT7i4CsArfnK8ibfemMkcoZI6uZfwoItxgKo0tb680KwjEQeCUSVpzFH
	b7JgfxJiR0A5DuGvxfLgeRld2KFFVJkKJTnpQdOF91CY3yga8BYirQZ+Mn4yYk3IjJUFtb8KL8I
	9QchMRkTXoQDao4/T7/CsoFxey4hyN6xgTtSOv13FOaLeGG+yvf6E8l0YhpjW7M+sI064t+Y61P
	HVsulI4+Qn4qUchHF2lvMtkCYNgcZWP5SjJY4TznfzyhYFZGJ+YOEZSneVRyUX0Ssy2c9TSx+j7
	C3/aDQVBPSzbPeluiA8lGb4ZFGWlVg8NzZ1CeJV9eTYMCJnQTuRyxm73TweG5+EAngk6tYzAYwH
	RAILtrjhsT0gbHpMTrJviyyIklNerhGs6VCfSoOnMn954Dz7g+MLNvTMO33fkO/fowEMFu7G5IM
	WmpshAwm/MNS3NIgwBQfKegE2tIVVx//wUefXCVZFubdsy6tF9Kh8eszze1Au9zKHwgGGF9vySU
	egAdLfNAKLZj8oUZVqqZTIbzUrT+uhngu8QKKo9X5mtdOn5Kb4od9UqKtT0Vt2tIjw68WlW4UuK
	84y3xBR/1/A/5H4FQ+zQy+8yYl/YKeuin2M=
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr166270075e9.11.1794899701137;
        Mon, 16 Nov 2026 23:15:01 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm6290695e9.15.2026.11.16.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:15:00 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Tue, 17 Nov 2026 08:14:59 +0100
Message-ID: <20261117071459.1649532-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179484804679.162984.8852491396666803433.b4-review@b4>
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

Hi Toke,

> How about we define a __ath9k_htc_check_wake_queues() function which
> takes a boolean "decrement" as the second parameter, and does the decrement
> under the lock if set? Then we can turn ath9k_htc_check_wake_queues(priv) into a
> wrapper which just calls __ath9k_htc_check_wake_queues(priv, false).

Sure, will do in v2.

Mehmet
