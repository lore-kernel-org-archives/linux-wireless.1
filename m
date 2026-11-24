Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539423;
	b=ftxRixBoUxwHO1FRrCTRQoGSNdArGnz4dExIPiulhs6evuBpo5TWFPbltG1p92hTewYP
	 G4zqWJlPf41ci/tIugNULCj7ji8PuCejV80IOP4AKKyj255dRnhJt7+ON1rf1ghTCYtb6
	 gZW7GQibR3XNA8C1VFJs4e9kelQXjotU38aBOgQ2Z2DyGbsbfuPZOJBhGl/8aV80Y8SSY
	 4p+cFwVnNrxp40iF+e53SRuuvR5rxYmWVhq4jJL4guxfcdniqc9Hmgx/zYRN5ILP5yAHF
	 BS7/eEQsOnbnEJ5FOeWYlVamzDxfawb5FgRK7wrN8HjdDgOG+cN/MgrNHrdIAhrb+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
	b=KCRMmxc5d4694EB1rNfhIguNU2fv6r6JmOoGa0IBJEy3SQiS+qasBX/weHMhRu8w4lg2
	 VFnkz8XPWCoynZJvwuqccHfu8yBAI54ywHyOEtLIXJYdHR9oEc3NYOXwhrYMXsVZKIjOE
	 fgnHIkss5Pfe1dipvrPD4PXMNpATwaE2AE9jc0Al1XCZZoZQMj1UlyH/1UslKJrbdNn3n
	 XzAw4zCFWyjvw1W4kr0yiIr/wya9hNSRzqKFqoMKxfkqdI+Ss7tUdp+qJRtSFN+lhBA2R
	 N+UioubjnIvaRI4JRKpPc9CMPiaBKblL/6iHBLIa14f2iARuhZrk2XwhE2nlZz8kf3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eN9AKtwR;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5C606A33E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A5C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eN9AKtwR
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-921375f52b8so51051676d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539422; x=1796144222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
        b=eN9AKtwRofP4yFvYfSB3nQYJlR2sd2N4zkA/z4xpQkwXpoERzr2vqheisg+3SCIgfX
         RKn9tLpAYs8qUCdx0YsW5aHSxIMbRFDBmAvCk3M7/dQk+EyqhCBU8BsGD5i2MTtc8swJ
         Oq2SGbs8OSaTnBH7VEOV18LNbaOee8WO1NW3DB18NgpFxrtobgF8Yd1pBxPllfBJLH6g
         u2kqY/86tDmtzFHTBLiW+6GfelSF9inpTyOsd5+VdL3rCBmLZiESyfKIAvTff1SP2Q7l
         UlZYIN7E61YweLQ4Br5n3NV89WSY0GVLAH+s6aBWfx82lv9mK1GvVBa202+EwHgT/FAI
         r/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539422; x=1796144222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6S+C9lbO9lL4PpPSoKibQFJs/OKawueyScWrx79ojU=;
        b=QIGo1/j4dLoluGx+ZOoD7FlWR7MPwXClbaa3qnaf1xXG+h5Ooltz18MFcr5aLbJ6XQ
         BE5n8ll/EpDzQHgcPNNnDSXJp9UMW2p524Xggjw2kTdZXHBcXUV6GcS6FXWZmx4DBwAf
         V47ahYNXsXfMsf7vsKG7q0PxF73vR8MckFCcB0QdzI8HyuQg3vQMkasxAn8wbJQiTcM2
         A1CSbJtQE9ZDlCKxtfrZhgEZpYV05EXdU5OJwRxYcCkotIOlUVsV0WJrcevmlmKk1IPS
         x5Ic0F5RdUp+OxQZ9yy9gIRvJw9OjuMUYiqLZWEksXo5cEaQBIryzDPUqKCzty5m4GLs
         Xq0w==
X-Forwarded-Encrypted: i=1; AL+hErGCRCZ2YJi4QVTnOnJW3C21l1FnIKb2Zq1S7mvWHDoQk3rdq2gZ6yQ86xKWw64afGhtOEQKCAa893DRjWPuig==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VhuL2FQ+RnO7b1YMYNvuKu5mcV+2V+Xk5TFg7C2XGTQfTG7is
	07clCKdw46gM8ZTZ9QdLXOWRy7wncbAv38ZZ0r2wLloe/W6BzfOje3wV
X-Gm-Gg: AZFdTZetsr44Dktt27EefCW1nwdBFusIYxoMWIKGUezxmUVa3goHeVZ/1ZlwhtWivgf
	uTFPic5/famBzKKc2eRSB3zDidbtv4r1pSwz5LdDfLUnV64k2uEuN9kiCRdTXkuxABS5QRIphhN
	yL4bcTFySDeIlo3XRSwAZZpIc10c2w4Y8iENzk+Onkw77fpYU+BjN+nzZVyQkmGYqfaWGmRTVtl
	jGRg2HWLPx+S40geDsBjFaXS16oxLKwNGYNanVFHc8HkBRuKv4Zga12YcxBP+FPFnYjgOikOAdp
	HESvmvEBWIJ7Y3FNWwquWitaESFq4W3Z4ZOl9ujg5BK1n+4M0AMWQ+M5X7BCbE6HdrOZcvcc6sx
	gmX/q6GBBEIcaQCu/qoNJJY9aWuMlwDqTG+ziBnJvnTne/w5lHPoKXKT79NbRqicT9AJZbrAQ9/
	+l80Ucrbr2/WcBF0JfyjOzHJlAU3HTOQfpn34DKeWRz6fMBg0xgqMaCGYpuiCnxPDvaHYRtbGYs
	pkhvLCjpNNhxX3yqNw0GPrlqcUFdjbIiJrVw0iBKlULR7PEnn+QrT3J5MucPVtwXprlByrN7gYb
	EMvYR0S076BwS0T4cHj5LYdKQTKj9fj6sD0=
X-Received: by 2002:a05:6214:4108:b0:91f:10b6:2743 with SMTP id 6a1803df08f44-92134b3ef75mr274765416d6.36.1795539422157;
        Tue, 24 Nov 2026 08:57:02 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ee175sm142108796d6.26.2026.11.24.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:01 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH wireless-next] wifi: mac80211: replace the CSA beacon before clearing csa_active
Date: Tue, 24 Nov 2026 17:56:58 +0100
Message-ID: <20261124165658.266252-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <26593ae869ed222980ac78ac869bc2745d2c282a.camel@sipsolutions.net>
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

Hi Johannes,

> > Fixes: e487eaeb076a ("cfg80211/mac80211/ath6kl: acquire wdev lock outside ch_switch_notify")
>
> I don't see why it would be that?? Please explain that.

That commit is where the clear moved ahead of the beacon replacement.
Before it, ieee80211_csa_finalize_work() assigned next_beacon first and
cleared csa_active only after the switch statement. e487eaeb076a added
the "goto unlock" error paths and moved the clear up, just before the
switch, so ieee80211_assign_beacon() now runs with csa_active already
false. 66199506fb91 ("mac80211: split CSA finalize function") and
1a96bb4e8a79 ("wifi: mac80211: start and finalize channel switch on
link basis") kept that order.

ath9k already tested csa_active before the countdown since d074e8d54785
("ath9k: enable CSA functionality in ath9k"), so the window opened for
it with e487eaeb076a.

Mehmet
