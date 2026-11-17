Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935143;
	b=KPf/YfMG9ZZtE5+6EO2k0Jr2JgCwI7zVGeoI63U/tBNnlkXw3pQbIrkyAxK12oFpf7HA
	 DKF5jSCy127uyCd6dskUNQJ/6UV0Y8S2R6J2YAfHwq8ldES91h98MrPgFJ8dVnlpogvAA
	 te3zSyFe0ZqFqlPP0iMC/FkgtFnb88QvVAbZbZGtDaHvzxCyKJ9qOSP8XVgl8M6dM4op+
	 gPlIcGr5noPr98tBtVst3VuLpko7k4bu17ucjuLqThKXJF810Zh7YYvtHFtQOQsOnTfBE
	 t9eQ7sYBA5cTLeKeB3cHo5N3hsHDC6Q3rtCZKSOUn6U+RfFaMBEaovKzGo65zODGQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
	b=Gfutw+0bVA61GIsjGiPUrlD/fwj5FKQ9w3Es4GEQWPq2RbHiIiVkJUEcSEFaoQXl/323
	 hX1g/w3NwvKpt02CSzyBdNFD37/OLyvyIBo83gCT5PSvZYYZi+fh58oaF3V4n4c2sLOjT
	 eje2e1q/DGc8Wq7SzosllgWMrkhJsgbGG39D0+t9J3k7b7ghKgWE5wvQ+dy2kRWZEhXZA
	 vx28mR34xoIpSEcy/6t/u0wYPvwNmvbGquRVtwhHFaa90eIIdOc6hGH1PbtB3u5TNQeZj
	 wzUM1gGNhTdWO6Qh3YWlNt0VshZhuwDuKLXmOsTrIfBEOpB0YKNAnJ5WhzZQQ3l8zaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTYoFPDM;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE196606A332
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE196606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTYoFPDM
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso4653276f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935141; x=1795539941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
        b=rTYoFPDMV4yHDeSSzCIhXz9Bqlic868Rl+75gbJGr3p9NcLqQARh5mKBDYT4xWc+Dh
         jVC6f3naEYgV7DvZ+6opdbS1x0LY5Frl/BOLYZVSstvkvBbVkJReSBOtl5oyrJmXyagX
         K6Znyv/wUXopbFOFr0JMCRV1kANTGZHMd4ksiQb/hB5gBTt613gTyq5c07j1CmCo7zbD
         rgYvIttuHgOlf6FyEm8Lp4tre/b2omggnYPrvZo5o0Jns/tdPzjbF/VbZmZQ6s1to60t
         3RX/e8m/uw/p/0ykj2zbSMIcr9qTuARMRapsYsH3jiPXd32l5lqA9HEBqBCVWpcM7f9y
         jLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935141; x=1795539941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
        b=fkUJM2fH5mVJPDYhZP8KsBJT4El/Gp9nk/IYfMwf4l38aGlKu9TLgB4/eoLwhfquoH
         GkC7p+TYppE3azjHSMF681DUuqZr/tBfmNAm7PlX/Uqgws9d260O8Ju3V2MkImDkwHh4
         X7cxhieeV3BGMleY3baZTn67GsMc2DlwH60JgJxO8B7Ka2Lf6iG8uEh1UA9iZ6kujuNq
         k72MOimGP8KAoN1gUMzxSwPpgeeGOGPQYXKQmOrsT0VWYmncJMd+xq1wAN6w7vnvSyNR
         TxUWg1Oio+Mdxm6R+Ivq65xIQCUxYMCGOYzCngBY5oZjiNyxbMg/6FEkN9ru1E8BnnZd
         Oljg==
X-Forwarded-Encrypted: i=1; AL+hErFxUmxqwt/JhTRJ9ZEK7GsBUUtZ7i9x1Bh77hC8kyyJxruf/nhd4hRlBI9fhyyzl8LZrnZ2r5ihaXNDzUtVmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fO0bbMqisqAkFWu2pVsoe8xDU3wleDDbwPnzj/DqRgkNt7eWK
	/TRRbJ0O8DsyrGMA5Mc/zstEJHepNX5wM6c7PBsTTBVI4CIcG0DxFDyo
X-Gm-Gg: AZFdTZf+q+nriQ4IviI47w484yTKZ3LpeWCkU6sHIB6MHRVoRwK2rZ56pgCrwIB5x9F
	I+5ypK/Jn7hE6g5u9SCTkRg3+UTKPYgL27viZ4Wp1YWTmTEatJl/8aVBi67UVUsPCdTCftcSGyr
	8Y18GosZKlhwbs9JvL1vIEmkbbmu4vYHdgzQd9+t0swHxGkBOFyDbLSgWSYvhfE6t6Q5Y2Ri7tO
	k67apz7FXUzBauMn5kUqXsnbNm2b9evVIcQ4FCGZx3PqYoFU84c/GZrR2glBrF+Vz7LPvB59+Aq
	IIWVTKSlQZaOs5aJj625YUn7LlrMwFEZWP4vTbYZ/Nx92MSCKILZwUOgHCdfr7MKTyyQT3Nojf4
	NTF4z1+sKEcYyBlpwyLSYKO9aBoDUJE2cl3DjHJzgUg5mXBOilRV98V3qfJkPaIgszLi/RSLGvJ
	0YYndZi8CJn9Sf8FcUmbw483vKn1OSrF+7k78ppy7zw4zDwRzbUnS3YyZXl/BYz5Q21kbc29M//
	ZS6AOTnH97jI0mL5FNKH4+iec9So3InsSQdO7Pw9WpRqVlBgfZ0aI6BXEfm9yXJaYFK8jpy8E8q
	OcFnEmjJbENe4fvgmolu3iVFUTD0Smf4FR8=
X-Received: by 2002:a05:6000:2009:b0:4a4:d8e9:eb5f with SMTP id ffacd0b85a97d-4a63378660fmr190808f8f.4.1794935141090;
        Tue, 17 Nov 2026 09:05:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a538b3d46dsm2678707f8f.43.2026.11.17.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:05:40 -0800 (PST)
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
Subject: Re: [PATCH rtw-next v2 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Tue, 17 Nov 2026 18:05:39 +0100
Message-ID: <20261117170539.1839165-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev>
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

> Could recovery use an iteration that cannot silently skip stations?

v3 adds a patch before this one: rtw_iterate_stas() links the stations
through a list node in struct rtw_sta_info instead of allocating an
entry, so the collection cannot fail. All callers hold rtwdev->mutex,
and no station iterator collects again.

I could not get the hang on the rig. With a test build that skips the
station during the recovery and leaves its BE queue on rtwdev->txqs, the
station came back without a list report or a lockup; I assume the TX
work ran before the station was added again and took the queue off the
list. The skip itself is real, and the new patch removes it.

Mehmet
