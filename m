Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877236;
	b=38K8whuZxEHjDlNFLu1YU8u6HZ2QU39TnuwC25IOQLmH1EHkHxSdILSFZxt8DU2EKTLs
	 fDrrD4S4pPLIycxT6UBd/e62evqsw3db7R7m0qHS/HQCtznmHRW0trA++Dz81itT58pYT
	 AYI7sLwJrVvg3rnT8x83EGrAg3IQhDk1DEsPZIcmQ2W9ohu9FL6FTyuWX/9RhQCiQdAC9
	 0+k6UfLlUs19eWIj0EFhyNQewbmy8vGnpvxJ2BQ8npKH/U5ByvZxhjbK2CQIVTO2d+wrC
	 kGvLnI0Pqh3udCR9Mtm9PLgdZxwD/DYkh/tJUbJgZp2GZLTQnrN25UBpRvrnoSwJ6zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IXy2JymFhA+X88tMegq3sd75f1KIiWfsHJC7fjLlgww=;
	b=fl5oW7nYbhLDDEtnwq3TPH08qvK3sVO/mqnaahrRVGrs50xZIGUVJtDORdImVdSQ/wJ7
	 6x1BmRNhx9tYd7gK7eb2LKqcOHq8XN4tzU7FSjWJgKbqL2OAbNRKoSAqNe2hwGsXIUUZG
	 7GiD6il4xVzkPJrKGZPgd2MprJ+usVEGNc27Gf7xieSgTPghGNiqAiTdiARVYTsjo3A86
	 1Beo5qSNFgH9oWc3n11iaGzjhH2yisXZwRO7PHjpH2hGstyL45xYAkcYduh5tHlMiE3h5
	 RXYVzDa/vIcT1378IbVbMmxwfCN/PfHnbPD7o7UbwuR3Ss8eXlZ9t6nEdlZB77oF9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXbjSL8z;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0F606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 01:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXbjSL8z
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9995ce866so39151005ad.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 17:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794877236; x=1795482036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXy2JymFhA+X88tMegq3sd75f1KIiWfsHJC7fjLlgww=;
        b=xXbjSL8z8pvZUVQ9AOk/SmlF2elkOczDYpcnCB8Ub1eB41oKB4aP2Xr4KlGeamalVr
         Vr5Y9zoSaUz+L78i9EHHfC2UZrdx1Y6ANwx0qFWJaOJ3+XNeAwGsKNj1iaGBf44uQmLd
         oud63ZI4Lcxd0mzHA7uf3g1hLZFIZH6YczzpeqZ3zF0G684iH0rHMJc6P42pYoV1Mfja
         nejh2x3KAZd/bbzb6uafLjuXO7SwoI20MjfK79dqUoPZa1pBrhyXCq+gZPx5yc4m9C8H
         UbmaDMpI5ZyhH3juDbIrfNmNyb+xmKTNlcGIrRqmsCFsbZQN8/RSsNYsJ5KYXC4qEaCY
         BJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794877236; x=1795482036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXy2JymFhA+X88tMegq3sd75f1KIiWfsHJC7fjLlgww=;
        b=M1fj/xnzvECoQKXh4j0dDxCpdwPvSepCYPt05mubBEUyXo4HebbdRhp1npyFswdi4M
         fzSFa+g4gFXT5PrA3nffZXuZ3LCuW/3W+okE285NCnSX88wqVbMCkJ1Q6U+tkaV8wR+9
         LgsKwHgtBINdqKYxHNVqnenbJr2I1XHCW0WMHLzKsFrjpINaWZnK0H+Tj5H2z6Rj+VFb
         FLPOryKW/78BoIhOsnA4wCYVZd1Dx6oxTdi92tW08lvIMusfMzdlnay8mZPYCT+Ttycx
         WdGVk42TnFm+mMKWKSFCNBBjFKPbfqW3qQF05Rq37NIeogvN84qDwL90cpvFLItY83fB
         gHog==
X-Forwarded-Encrypted: i=1; AL+hErEhG1hQj/+kVQvnrxH7iNRRgKZJaWxu78j4rQApwsMrWlT87AktI8ZLjs8ZdFhp9q/dRQ+zoxAYiqNQKcbCzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/srDSfJN7ui0bCB6JRU57HnMBIiPJe20gu66KJzpUh4XqdvFfw
	xEh5As8p5sLRY1FKrxUjgejUGjvgHcOfVpeMvT6+HEAogXGTCwMK188a
X-Gm-Gg: AZFdTZdsBM0F3uqHmKJkG42a0KNhmgbdrCst7xRxw5r/fIHym0AOxcoJYI5UO8VzXWo
	f9DJk0LGjKpKuSipS/gmSMUHJS0yJfetP38+znkv28qErAxtBqZqno6siqVzPYukSfyH8rmxRv6
	7Jc+IqPAoqXN7TC++vADGiZsogPVlHa+vIIoAmHeic4i/Hq72sq6bqjyN7PBbX71P1B+o8y+0vo
	KU6DcA8PaeRI4NW8RTlGrnu7xxctzP+UqYDpJd4q1ChI7mJ/EisLLXeeBw21hebsi2nm1PuksFr
	OfU33rn8bARFlu6rYMv4Ocw45pdU+Gbhr+sTpyCZmrgQ7eUXvNZJkc/zBVTeXAhJcHUYrTP+SdW
	3PDcWB+N4wGNUiegZwRxCgdvndyXeEKVYorYACTt3U2COSxW+SUoiwB69nVfiuIVml0vNM0gRjJ
	PyTpRltmTWdIUZ5+XqRZeDxi++0unUfIGv7kyWWxQck3Ces1kWk1sbvo+cQeUB509IEtaSPu47L
	QK9E/ILflPIBhiovQHCHK0ugzjt/9DXOPw+3UoB+Vu86zzdaTJHzmIsdwv8TukqTU1jv/Z0Q38r
	p48OBmIuCGoPp/Nus83D5urHUniObThYeBBtuOZQOLGdWJ/HSifk4KdojJmjkRx6GdDFxqTALO0
	n5Mh90yZb+CT/OB+r0SP+XqLsXNOfbrG3j4N716oQ
X-Received: by 2002:a17:903:41c6:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2ee0dad02dfmr128283445ad.32.1794877235439;
        Mon, 16 Nov 2026 17:00:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5716795ad.4.2026.11.16.17.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:00:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	linux-wireless@vger.kernel.org,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH iwlwifi-fixes] wifi: iwlwifi: mvm: correctly check the API version
Date: Tue, 17 Nov 2026 10:00:28 +0900
Message-ID: <20261117010028.1591963-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193144.ab54bc9717fc.I8cda260e2ef7aedd790915a17cb6832010f82aa4@changeid>
References: <20261114193144.ab54bc9717fc.I8cda260e2ef7aedd790915a17cb6832010f82aa4@changeid>
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

Hello Miri,

Same change as I tested in [1] on a Dell Latitude 9420 (AX210):
18 of 50 driver unloads hit the fault before, 0 of 50 after.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

[1] https://lore.kernel.org/all/20261113080830.1459856-1-sammiee5311@gmail.com/

Best regards,
HyeongJun An
