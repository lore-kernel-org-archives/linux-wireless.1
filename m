Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066697;
	b=hOXuF4OTIGSM8GyilW2piOpXGQEzJhp+G4ED9ePpcmswKlFpMzCgFGeC7KjHvu/LjhYE
	 sU9i0rhHByG88kLfuUg0xTEW49rIAuAis/2s25AeXgrGrnvxbv79UvZ7UB2UtVnZikrZh
	 dya65R+7QJK24rLhDUYho63z08NCentZJ6YyocckC4vSxpb12PfcK16eNI6kzjt/RHS52
	 PvB+Ogqs0gFTFyBUQCxirMjAzr3yHg6PIPOCX1O5dHNPcZyvbESB+9v4EtLSiF3DdIIC9
	 r4B/WwoHZCl2CeB+DhEOjMZeGScGsbJQCrw7kmd6vwT21/QIx4JdgClnICuLFEzNpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
	b=bOvAY23qWQF7gs5lCQWQN59QHnm9EYO3Pc+xQWxu4MZREvPT5Ydl4Bv73iE1rY3fhKtv
	 NIdlFmT1RDG1SlywSTZQTFm9kEqu+GAu41dJF/feDarXkVouJIfFpgjGTVVPhMTWKp0Lw
	 OKqLg6iWRmnLpMKN0cFLiv/jDWls+vF5NT6T7r7eXFHBz8mKnJzI7PHCVYTpKatjmntnh
	 EAuIr6gwtMD8KwCYJ5LHUc9Oxn0hoXEJjfm3AK3nHkWDAj0ECiHqVTQlzopQuMYG3Q0M2
	 91KhtUrVrNM1QhrpviiAe/I3GPX6Fo6fpO0PtHRIBDaMeDPt54HtWZ5LTsToOWsktKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s8k2uK;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B55606A32C
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 05:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s8k2uK
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49d64a88222so279325f8f.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 21:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066695; x=1795671495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
        b=p5s8k2uKzat9cHMJJRMBfbU5L1KpVOw1oCQDa5K2/ZeSDXnbKyEVrYc6flFEXCjCen
         JHFuENPP2UUmCGhFqKB3ohVyQPafVHPjN+yGHtBjWJvqeU1fCoU4Eri+dew4AnnSESA+
         rwSVZ4KyQszYMnxLooDltbz1l2i4TKiOwq2q5zO5YznEdhIlQS48P5YjBNq5lDPVHhis
         MH+c55BgYQ7ITz75kavRpm4XzmLQsLDiyubOWat5DFZ0u7+KyQlGRG6GLMTgeXk4hLTD
         ha83bmZlcsjRgTpO9Yd5bPIE+k524p7tJ/I/2PMu91Wg5aCzpH1iSaVGLtIhrasI3K7D
         nVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066695; x=1795671495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJwtMsof1yNVRlkOI64mZgUWLXJ+UbMqtHGUp5escDA=;
        b=WXDdEAr5DtgtOnkOEOdmEBzfeb5CcA1dxAO9AjX1FtcuDeMwvr4gUIMcq9bdWPrysS
         /YogjstA19Ih2/inCMIx5DzexDdOP5n5idGt4/X5OjZEgasnkItZDYt2fmOhvRimbczR
         CXh9xe/S+k/xC2jU63Vh+62IXvx9v8Rey0hCP6GhGm5/Ds/vY9f3bdsQiWIyKG3gjEAt
         pZTAZ9CpcvQidZzy9XN+39zvZYu/TFvOBfRjWYzWufY8mSOsw6wiVNsJTqn+y5QysTTX
         RWoGzjKhFEq0lVsL/4t+axRtwMNkCquR29m2sXQgZ4UJtcrZz+pFA6qAXnkl8HLaKoki
         1A8A==
X-Forwarded-Encrypted: i=1; AL+hErGTF9hJB0uyVNpZL7GdPFr8/qi0rVtRit1RswXZf0FMisVWX0Edbz5UnkeNyjPsn8LwUUsDKVNoYPwsj6CTHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z83D44GzBfKqD96UrZx1rVzSYOx2as97w6Q2LBFntjxajSZ1Sew
	KGMdJuhTCFCmTHpFGYAt5Yhxl8JpTcaIlvde9rRU0LXwGN2n467J+qhZYVi6TA==
X-Gm-Gg: AZFdTZeTlAaA20sOqlAXz9HuUK3P/BmmQ6199q+LTGgCPLQ37n9rdrZ19PYvqHTQ9Oh
	8Ys8IISmd3P2JNbjOyZzfZWeU3doIA0rTuc/bg1G3wcPZ5UBfhqXndPjQllPovj5FBXa9u+PEZd
	zck4i4GunnOSNUWt2NMCx2dARfMZJe+piYQrnbLT4/7D9hw9Xl5NFUlGO87nT2cjFukfFQBsbAZ
	K0yhpcMpdslwmOPVULJGf2p0ljNEe8JVoz2zbOSGc+4V1Mze0c9Awi4qcUJyw/gZjzRuzOdrHTc
	n3y/Z8MN5bGuC+EU0cQic+uX/AnSS3kDkC/MGbf55a46BwxyL9BcSpig4U6GPuflgyf1OhzPuuB
	x34BQMGEVFSM2ULsBRIqsVZyZRBpDXeyulRzy/2Jg868GNo3qQwFgcmIyUA70mZ3beN6zHF6G0T
	O5VDNWMRJupK6aXD9AWkiHO3hdY56ayRI2z4d2m6RuZ5mDrtRMbjVCbozGh6xmenp+L1+AhONEu
	f7aDd92FR8PC01sMWWFYowMCAgdKYs2A4GJM6+ob08MzXMQOJ7fo9LAAeEmZWROz8+EBzmzBCYK
	t9G48tSGMJWPnnl6MZoe4uyCvoar5Ycvf1A=
X-Received: by 2002:a05:6000:2383:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-4aa50f2405fmr170360f8f.8.1795066694865;
        Wed, 18 Nov 2026 21:38:14 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm9200091f8f.8.2026.11.18.21.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:38:13 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 0/3] wifi: rtw88: channel switch in AP mode
Date: Thu, 19 Nov 2026 06:38:12 +0100
Message-ID: <20261119053812.2435837-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118231940.3950-1-mehmet.fide@gmail.com>
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

The build-wireless bot marks the three patches with "Patch does not
apply to rtw-next". That is expected: v13 needs patches 1-4 of the
firmware recovery fixes [2] first, and they are not in rtw-next yet.
On rtw-next 0bdc579dbfc2 with those four patches, v13 applies cleanly.

[2] https://lore.kernel.org/linux-wireless/20261117171003.1840491-1-mehmet.fide@gmail.com/

Mehmet
