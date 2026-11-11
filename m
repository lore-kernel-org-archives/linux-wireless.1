Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436519;
	b=Gozmlczx9e/Xcink2DcOlYL+843PkEPwyeGr3HX1MoEXtmNVz8Pnhp/GMcN8jIbRv/sU
	 rFg3qdVHucEYcKpbNUUZ6jYW7X3rrfJcxitFDeHb8h0jqzYpnGktMJrXaYsNV8hrEKbuB
	 OBUXVsQPLCH1ivZDy65x4x7X6+dQp35wjvhz3XrJss73WXhxTVla/Whi2o+cTv4z/Bacp
	 lQDBQPxmxkNIN+k6RyshVyuLk9EYOtXRs4IhLIMBe3rqYJnAhde011191yHg8BWdSEH5s
	 TjeNvt9Er/7Gn7IjPXAS9jLce5mZN0azJp7+kmgy6rr3X6IrC8BcQZpdpTR+ve0Dp3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=;
	b=TzepURP61Vwo5VrJTSe+HXZq7CGfLXBbNKMdhDCMS88NiN3FIXnBibRd+Cmze29MqzUd
	 zDvES9A4sf4YaqD3B/4a0X/e9mpIjJmi4bVflT1VAyU7h59OBs3re2tmkyS15SfPd0rmk
	 SnB8hKmFinJ7HDRQIaGSryO/oz/ZCYJNNvZFqimZWPcinFQB1qws3A2R/dHz2EqX+4eD1
	 fwG8ALjJKsTPKrjt77bqQSE08nAnYUEa87D7VAx8MSbnnDL2dkjB3+ZxQIK7kDa6KMhKk
	 VcaXMpeuyR9uTAQtQbfJbaiZTHu15jc5+UvilsGHKJigOEatiOcm5QniJNcEqosQrqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htUbTrxB;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D26B606A89B
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 22:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D26B606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htUbTrxB
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8439fe796ebso2385565a34.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436518; x=1795041318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=;
        b=htUbTrxBBQXmtQF64LH/veKfhH9JGzU0lz2XC76ugUWuhp8dJ+Sdvsp9X7t0XBmLY+
         0DiZtqCorj0nEslv5NSJQ//PTtKRi37f3936JSxuCNe8gHzfqZt7gGlFq8I9PRn7HLx7
         s1lOdo8OfuSltlS96pLp54magY6aYgacGrNFqjFPEF/WYhcmNRxIH7fyubiLckR1EghD
         Qu5PQt9AU2uWU43w7/KDSWrz5HH7cqPB0RY4nOcRCKvevRrs9mXhFsIXWiDetY/CmQID
         WAiis5YgD57St8RJwAM7Yowkpew1ospfWPNfSefAc/55jV37p3sErKA1laqH050bECKY
         uCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436518; x=1795041318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UERT3mFgssSg4oCx4N2jl+oQBf3c00QRenf12tiJJLk=;
        b=oEcvN2jjs11Draf096QTuf3hc6o7IPBacgVCaznV9a6GU0tpYyRBH73tYGqABP/I3v
         ton2TWGUccQh1vTXUaCL2lkmYFMJjUlOPmWWGY8AbcBAYNxYFjvPUoiXzpaMO3xMXJPR
         pvQNVvQEYCoXJup68b7geWUz5P0zvFkkBsATaNfoWflcdB5O/pkSpdSlS5MsHSdBLGQq
         kMdceOpmPtCAiYOQcSRIe+gt2PiU20D00J1q+IWQq9ruUcXSh+8+felQ9a4+ML7897rA
         fYpeBtcsshM1zfJJP/ZbV8GBKH3vgh2TKcpL7Bi2UulEQNQ9I5W5p+pydwQMZc9RaZ6b
         ZCWg==
X-Gm-Message-State: APuU4Z8YhMmxdhll1Ly6cChIYAD2GKBb5+yNsYPL4CRewla8TsznH7yA
	IJyv/n4rX83ZHLcwreRX0LeFvyt86Etc2QPRwWEmYpwrHD8xisoLWbtAteZsvnll
X-Gm-Gg: AYBFou3YYsqB0/wyh5edmqUa01M8PInF2e836VTbxnaPV/QhWuyVbnPbWWosTotvJld
	yMS6VtjtrQCX6cnklfo0H8dgdpjJ5nFcHUPoU14AeP43BX0AZSenZZB37yayvZW39G9b9tQ+/Fe
	sSa9/y+/vBtsaEB1IgScVPioD9fQwyDZaUmfbPJTDmLJQ53K8aX8Vcpn8lXeFQQe0NFQ/ZoeYcS
	22+TjcYPfGMIaBzY4GhO4w3j4OMShiFVxNko9H7SvJMJ04luU/5Uek5INKsE2zJmEQQvVjNDbuP
	fgX2AYL48ZPuXpyWMC34K1oNSyDbVTUzSWM13QUgM8r2LUKv82cJMZDjFZMD94CnyaNC+14AfCu
	fDhRXhOH4oVeXnVXxqE4bCrOWODO56itUscZ93WSSeu0RiE7XdsorqMVREF8Y204L0k+RmZjbN7
	FMYBTu1d3gquy1lsjH4gDe2KNn2WLvhA6UkIobEHRewCiYurk1HmQLTCzAICc2CNl3SKvb3XQMx
	jEgS3h/TIT/XQu/sZGO6jhCfV6PAHAS+aT/fRDAF29qfOj8iSfMUMS3KSPXC5MJkXmN+BRZeccK
	2XAvkgnuPqGGuOwoGklhRFWZ53IiZJ/tCcDBgpnCmzwE3AfxtLMiAEz9yOAVI4qTZKoWyw==
X-Received: by 2002:a05:6830:b13:b0:81e:a323:f3bc with SMTP id 46e09a7af769-860f2885fc2mr3646271a34.13.1794436517980;
        Wed, 11 Nov 2026 14:35:17 -0800 (PST)
Received: from cachyos-a.lan ([216.212.36.213])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7ebsm5312424a34.7.2026.11.11.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:35:17 -0800 (PST)
From: Patrick Lawler <patricktlawler@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH ath-next] wifi: ath11k: require unique station addresses per radio
Date: Wed, 11 Nov 2026 17:35:09 -0500
Message-ID: <20261111223509.283556-1-patricktlawler@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261001164139.370144-1-patricktlawler@gmail.com>
References: <20261001164139.370144-1-patricktlawler@gmail.com>
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

Hi Jeff,

Gentle ping on this one. It still applies to the current ath-next.

If you would rather have the driver-side check from 1e744bf218b5
instead of the mac80211 flag, I can send that as a v2.

Thanks,
Patrick
