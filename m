Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194227;
	b=JTYRKFFAAfhPmQaZ1VgCViGn9dbhnnMyBOv8/hQAtWBcTNzAIZcyKWIumCREpWJI445E
	 vZfr73SJM1sTBJX/+8lXlFoGNOUNoclR4KvAe/RwIQaW5ksY9ixYmLgK8WWDh8xozLTYj
	 Xj2lmuyAnFrMFZMq2AgNiTZ4foik3mP886GLb7vRSXSUqEnZLHOMxgNODX0LOOuUgS9V7
	 SOnbwc/CA5X58b2u+jPxQul6kAFgNoObdsGmXbkSB1Z8tC35+uIOeon2nTpW+tYdS43F3
	 iwg6V9/GmUfeHHZWxNaD2zmINm3NTMMz6DzBY8zOh9nx1uTh4HmlY/RtWOglAMN2HTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
	b=GRbsH3hw0DFJ2R1WwlIAdDNPqx83vmE1WhNHRuJhsXdp65YW1kcNRFK+W9aZ2Fxo8a/S
	 PvwHjVF737HRFGWj3p9ZS+a/RT72VVYpetNc4fIDCjYviTe37XTOHHBiPp1fjWYcQWhsS
	 QGbqZVqcQMN7Un1agpldsLzkmvbCMT/gOUbIPrHCCm8YF/Zxofki92Dr7wkvXzvyeEFPV
	 O/Ubmh/3sGsr0jPuRuodW96ySWWJH1KfvHygbRqblhWeAC4tHNdIbQzWABALvjPpxaXFA
	 ktOo/OjqTkAmxeSdeGCb/Hci6Otk3osP3DN6NC1JzQvnR2F+siL9hmnmZdsNPbcWKfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEoHfiAe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C2606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEoHfiAe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso824258f8f.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194225; x=1795799025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
        b=FEoHfiAeXbTKoKcTTWjrudkgxZzqoFkjZFkDIve6OKHhNkR8t40F0+k7OmcIhmDvBB
         0LsZw9KCH8472aTWAt1Ca31aHng6zbhHJW80OH38qQkR8IX0gOY6J00MtxCZ3hTo7R6/
         SkON/RnTrD6W2StjPTcHVS8puS7NiW/uiYWuSlK5+CSYoqmhDLBIcGULW0SOcyzRRQVm
         fvnBCaGDpZzqwN6pU4tCU4TpbW/FN+Hku6/x0SSQTwl8ZMXF4W9VqsSH6h7PgGlJEr1t
         +tYTTPHWpKKXL8hdH+0wpWVIqGqR4JGAWVLG6uvgukfFeOUi4rN90EkVHAl9B1xugkia
         Mb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194225; x=1795799025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
        b=1IDrnhD7AASGJks+q5nYdlO0zQArT6KGhHHxZHbjU5vjQ/oIswPegtdtxzOpXNgxn/
         6HdmNrjueU7JDsG9uSaWPhrV0oefKPhcyFlXT9hAkhVioZDCPIn9G3sXhs/etTTFspr0
         59UK8vpciaS8151J0mtwc7Zk6WaPvRXGSQDmWF1pHSPUncjvLjorxz5SuJYITRPIhLUX
         9Ai6zodLdQzeUTcenud0GOe7MPPg+acMkr+IUK8ZH+4cXsTVo2DAylbLmYUlzmE/w0vM
         BEVY9T/in70QXhi9+QpwG7+CM6ax2n4o4ZxH/9jgfONPeQeGakv0AMMaq79GcidpAJQ1
         F7dg==
X-Forwarded-Encrypted: i=1; AL+hErFoqM6+zXn+6S6ypWWK0DgEoYXlumn8ZuKxhWscs7EATmxYFAiZQnbQUdWxQXbsbGecI5N/bzKEe2NvWDDOyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BzYLHS43G0MZurl6WXE86ASSZjEin7QIOxefkp8W+6wGen79J
	wGS7J/1YifftSSvtCY6RSeikqiXH++tWfbISE9dftBThPyIal1GEzM/G
X-Gm-Gg: AYBFou3vAKnOTfF5XNtC5mTTEKPh9PWuZ+uw0O7z/3C/D7sv2CmPLtEaZRd9ZsgQRPW
	W1CD2948AdEIDvi97h5VstsXGLJ0sljyz1JGVaeQSNWW9CO/UAnqx1qpQ5ZxDWXHwRYaZipLHie
	n6W/TW4rUpjfvKARjxeLAp8zD1ESC1+MucQZDhNj5gtrUsAPtdYsNPKHVJJCNiTPGoukeDPZBFG
	HBZJQinBZO64s+x/v0FBjmoIt0xo8069zvEsV7BU7qRZommSgyePQre6NqJ2vgRZzxFrEXdK5Tn
	+TDk0brG22qRUgA5yTEmXn28vRUjgx1H1VBGvKWIoLgiMK71Wh0EMXhRB32Paatm6Is//RKEfTO
	yvHxYre5JisitAJmhN6ID2xnDXhVJ2G7Ss/saGbHUzG+/NB0N9UDtM78hqVK7+RUEKfXag/Q6GX
	6RXnfpSsc/peCjpZCktd6EWBHpPNF124sr1lap74I/Ge9mszzsDumDEoEpTHWrVtFPeQoHgkjfF
	g9xGxJBH+LnolAIgUE7KAGlBq18jGtRoVmCVA169G39np1WL7SBFKgBggfqaEqdZUwrItLfAViV
	rbAXjI3RAH3Ugv7ZI3rLuB3yGEGjuXTbxYE=
X-Received: by 2002:a05:600c:a09:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4bb88829115mr82707195e9.35.1795194225495;
        Fri, 20 Nov 2026 09:03:45 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm79704635e9.0.2026.11.20.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:45 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Fri, 20 Nov 2026 18:03:44 +0100
Message-ID: <20261120170344.375569-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120141554.68116-2-luka.gejak@linux.dev>
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

> Does the short interval case need a smaller margin here as well?

Yes. With a beacon interval of 19 TU and a count of 10, counts went out
two to four times each in all three runs. At 100 TU each count went out
once. v14 will size the margin to the beacon interval in the queue and
hold paths, and I will repeat the 19 TU test with it.

Mehmet
